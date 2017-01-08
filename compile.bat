@echo off
if not exist ".\unpack\data" (
 call prepare.bat
 if errorlevel 1 exit 1
)
regionchecker.exe .\unpack\header.bin
set gameregion=%errorlevel%
if %errorlevel% equ -1 exit 1

armips compile.asm -sym ".\unpack\zelda_phantom_hourglass_dpad.sym" -equ current_region %gameregion%
blz -eo "arm9_compressed.bin"

makearm9.exe -c "arm9_compressed.bin" "arm9_header.bin" ".\unpack\arm9.bin"

blz -eo "overlay_0000_compressed.bin"
copy "overlay_0000_compressed.bin" ".\unpack\overlay\overlay_0000.bin"
if %gameregion% equ 0 (
  blz -eo "overlay_0021_compressed.bin"
  copy "overlay_0021_compressed.bin" ".\unpack\overlay\overlay_0021.bin"
)
if %gameregion% equ 1 (
  blz -eo "overlay_0020_compressed.bin"
  copy "overlay_0020_compressed.bin" ".\unpack\overlay\overlay_0020.bin"
)
blz -eo "overlay_0029_compressed.bin"
copy "overlay_0029_compressed.bin" ".\unpack\overlay\overlay_0029.bin"

if %gameregion% equ 0 (
  fixy9 ".\unpack\y9.bin" "overlay_0000_compressed.bin" "overlay_0021_compressed.bin" "overlay_0029_compressed.bin"
)
if %gameregion% equ 1 (
  fixy9 ".\unpack\y9.bin" "overlay_0000_compressed.bin" "overlay_0020_compressed.bin" "overlay_0029_compressed.bin"
)
cd unpack
call build.bat
cd ../
pause
