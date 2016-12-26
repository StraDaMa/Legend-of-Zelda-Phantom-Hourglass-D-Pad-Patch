@echo off
if not exist ".\unpack\data" (
 call prepare.bat
 if errorlevel 1 exit 1
)

armips compile.asm -sym ".\unpack\zelda_phantom_hourglass_dpad.sym"
blz -eo "arm9_compressed.bin"

makearm9.exe -c "arm9_compressed.bin" ".\unpack\arm9.bin"

blz -eo "overlay_0000_0000_compressed.bin"
copy "overlay_0000_0000_compressed.bin" ".\unpack\overlay\overlay_0000.bin"
blz -eo "overlay_0021_0009_compressed.bin"
copy "overlay_0021_0009_compressed.bin" ".\unpack\overlay\overlay_0021.bin"
blz -eo "overlay_0029_0014_compressed.bin"
copy "overlay_0029_0014_compressed.bin" ".\unpack\overlay\overlay_0029.bin"

fixy9 ".\unpack\y9.bin" "overlay_0000_0000_compressed.bin" "overlay_0021_0009_compressed.bin" "overlay_0029_0014_compressed.bin"

cd unpack
call build.bat
cd ../
pause
