@echo off
rd /s /q build
rd /s /q dist

setlocal
set /A Build32=0
set /A Build64=0

if "%1" == "x86" (
	set /A Build32=1
) else if "%1" == "x64" (
	set /A Build64=1
) else if "%1" == "" (
	set /A Build32=1
	set /A Build64=1
)

if %Build32% == 1 (
	call :BuildPlugin "%~dp0qt\msvc2019" Win32 x86
)
if %Build64% == 1 (
	call :BuildPlugin "%~dp0qt\msvc2019_64" x64 x64
)
endlocal
exit /b

:BuildPlugin
cmake -DQTDIR=%1 -G "Visual Studio 16 2019" -A %2 -B build\%3 -S . -DCMAKE_INSTALL_PREFIX=dist\%3
cmake --build build\%3 --config Release
cmake --install build\%3 --config Release
tar cf dist\release_%3.zip --format=zip -C dist\%3 .
exit /b
