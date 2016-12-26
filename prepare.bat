echo Preparing source files

if not exist .\unpack\input.nds (
  echo "input.nds" not found in unpack directory
  pause
  exit /b 1
)

cd unpack
ndstool.exe -x input.nds -9 arm9.bin -7 arm7.bin -y9 y9.bin -y7 y7.bin -d data -y overlay -t banner.bin -h header.bin
cd ..\

makearm9.exe -x .\unpack\arm9.bin arm9_original.bin
blz.exe -d arm9_original.bin

copy ".\unpack\overlay\overlay_0000.bin" ".\overlay_0000_0000_original.bin"
copy ".\unpack\overlay\overlay_0021.bin" ".\overlay_0021_0009_original.bin"
copy ".\unpack\overlay\overlay_0029.bin" ".\overlay_0029_0014_original.bin"

blz -d ".\overlay_0000_0000_original.bin"
blz -d ".\overlay_0021_0009_original.bin"
blz -d ".\overlay_0029_0014_original.bin"

exit /b 0
