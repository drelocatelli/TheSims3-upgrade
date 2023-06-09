@echo off
setlocal enabledelayedexpansion

for /f "usebackq tokens=1* delims==" %%a in ("../config.properties") do (
  if /i "%%a"=="gamePath" (
    set gamePath=%%b\Bin
  )
)

set backupfolder=%cd%\backup

echo Backup "!gamePath!" folder to "!backupfolder!\bin" ...

xcopy "%gamePath%" "%backupfolder%\bin" /E /I /Y /s /q

echo.
echo Backup ok
cscript //nologo "../bootstrap/dialog.vbs" "Backup done"
echo.

echo Running GPU Program
echo.

set programGPU=%cd%\bootstrap\TS3_GPU_Addon.exe
echo %programGPU%
start /WAIT "" "%programGPU%"

echo.
echo Program GPU exited
echo.

set programPath=%cd%\bootstrap\4gb_patch.exe
echo %programPath%
start /WAIT "" "%programPath%"

mkdir ".\files"

echo.
echo.
echo.
start /B cscript //nologo "../bootstrap/dialog.vbs" "Select an option\n1. I use cd/steam\n2. proceed."
echo Select a option:
echo 1. I use cd/steam.
echo 2. proceed.
choice /C 123 /N /M "Enter the number of your choice: "
if errorlevel 2 goto Option2
if errorlevel 1 goto Option1

:Option1
echo You chose Option 1.
xcopy "%cd%\bootstrap\ld_TS3Patch10" "%cd%\files" /E /I /Y /s /q
goto End

:Option2
echo You chose Option 2.
xcopy "%cd%\bootstrap\ld_TS3PatchEA" "%cd%\files" /E /I /Y /s /q
goto End

:End
echo.
echo Copy files inside "%cd%\files"
start "" "%cd%\files"
start /B cscript //nologo "../bootstrap/dialog.vbs" "I have selected the necessary files for you\nNow i'll open a folder, copy these files inside ´Packages´ folder then put inside your mods folder\nThen, copy the other files outside ´Packages´ folder for your game directory\nOpen the Bin folder of your game, then open the TS3Patch.txt and change TPS=500 to TPS=1000 "

echo.
pause