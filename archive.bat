@echo off

set CONFIG=%1
set BUILD_NUM=%2

cd /d %~dp0
if exist deliverables rmdir /S /Q deliverables
mkdir deliverables

mklink /h deliverables\MathLib.exe x64\%CONFIG%\MathLib.exe

del /Q matlib.*.zip

pushd deliverables
..\bin\7-zip\7z a -mmt=on -mx=1 -bd ..\matlib.%CONFIG%.%BUILD_NUM%.zip .
mklink /h ..\matlib.%CONFIG%.zip ..\matlib.%CONFIG%.%BUILD_NUM%.zip 
popd

if NOT "%1"=="" goto END
pause
:END
exit /b
