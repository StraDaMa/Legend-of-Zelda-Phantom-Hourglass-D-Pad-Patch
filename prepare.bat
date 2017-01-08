echo Preparing source files

if not exist .\unpack\input.nds (
  echo "input.nds" not found in unpack directory
  pause
  exit /b 1
)

cd unpack
ndstool.exe -x input.nds -9 arm9.bin -7 arm7.bin -y9 y9.bin -y7 y7.bin -d data -y overlay -t banner.bin -h header.bin
cd ..\

regionchecker.exe .\unpack\header.bin
set gameregion=%errorlevel%

if %errorlevel% equ -1 exit 1

makearm9.exe -x .\unpack\arm9.bin arm9_original.bin arm9_header.bin
blz.exe -d arm9_original.bin

copy ".\unpack\overlay\overlay_0000.bin" ".\overlay_0000_original.bin"

if %gameregion% equ 0 (
  copy ".\unpack\overlay\overlay_0021.bin" ".\overlay_0021_original.bin"
)
if %gameregion% equ 1 (
  copy ".\unpack\overlay\overlay_0020.bin" ".\overlay_0021_original.bin"
)

copy ".\unpack\overlay\overlay_0029.bin" ".\overlay_0029_original.bin"

blz -d ".\overlay_0000_original.bin"
if %gameregion% equ 0 (
  blz -d ".\overlay_0021_original.bin"
)
if %gameregion% equ 1 (
  blz -d ".\overlay_0021_original.bin"
)
blz -d ".\overlay_0029_original.bin"

exit /b 0
