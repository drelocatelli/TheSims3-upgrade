@echo off
setlocal enabledelayedexpansion

for /f "usebackq tokens=1* delims==" %%a in ("../config.properties") do (
  if /i "%%a"=="gamePath" (
    set gamePath=%%b
  )
)

set backupfolder=%cd%\backup

echo Backup "!gamePath!" folder to "!backupfolder!\Bin" ...

xcopy "%gamePath%\Bin" "%backupfolder%\Bin" /E /I /Y /s /q

echo.
echo Backup ok
cscript //nologo "../bootstrap/dialog.vbs" "Backup done"
echo.

echo.
echo This modification, combined with the use of the 4GBPatch in the optimization tutorial, will cause the game to utilize a higher memory limit. This will improve performance and reduce lag.
cscript //nologo "../bootstrap/dialog.vbs" "This modification, combined with the use of the 4GBPatch in the optimization tutorial, will cause the game to utilize a higher memory limit. This will improve performance and reduce lag."
echo.

rem Replace Sims3.ini
set "search=MemoryUsageLimit=20000000"
set "replace=MemoryUsageLimit=40000000"

set "file_path=%gamePath%\Bin\Sims3.ini"
set "temp_file=%cd%\bootstrap\temp_thesims3_upgrade2.txt"

(for /f "usebackq delims=" %%i in ("%file_path%") do (
    set "line=%%i"
    if "!line:~0,16!"=="MemoryUsageLimit" (
        set "line=!replace!"
    )
    echo !line!
)) > "%temp_file%"

move /y "%temp_file%" "%file_path%"
pause

rem Replace GraphicsRules.srg
echo.
echo As video cards at the time when The Sims 3 was produced were not popular for having generous video memory, the game used to set this configuration to the default of 32 or 2048. However, current video cards tend to have much greater power nowadays.
echo.
echo You must do this manually, ok?
echo.

rem copy "%gamePath%\Bin\GraphicsRules.sgr" "%cd%\temp"
start notepad.exe "%gamePath%\Bin\GraphicsRules.sgr"
echo.
echo 
echo.
cscript //nologo "../bootstrap/dialog.vbs" "As video cards at the time when The Sims 3 was produced were not popular for having generous video memory, the game used to set this configuration to the default of 32 or 2048. However, current video cards tend to have much greater power nowadays.\n\nYou must do this manually, ok?"

echo.
echo "Press CTRL+F and type 'seti textureMemory' in the search box and press Enter. Then, simply change the value found to the value presented in the VramSizeDX9.exe executable. (In my case, I change 2048 to 10016). After modifying the file, simply save it."
start /B cscript //nologo "../bootstrap/dialog.vbs" "I will run the program and the notepad for you.\nPlease save and do not close the notepad!!!\n\nPress CTRL+F and type 'seti textureMemory' in the search box and press Enter. Then, simply change the value found to the value presented in the VramSizeDX9.exe executable. (In my case, I change 2048 to 10016). After modifying the file, simply save it."
echo.
echo I will run the program and the notepad for you.
echo Please save and do not close the notepad!!!
echo credits: http://enbdev.com/download_vramsizetest.htm
echo.
start "" "%cd%\bootstrap\VRamSizeDX9.exe"

pause

rem use more CPU
echo.
cscript //nologo "../bootstrap/dialog.vbs" "Being a 32-bit game, The Sims 3 ends up restricting the overall use that more modern CPUs can provide for the game's performance. This modification will change that.\n\nFind the line 'seti cpuLevelUber' and change the numbers 2 and 1 to 3.\n\nPlease save and do not close the notepad!!!"
echo Being a 32-bit game, The Sims 3 ends up restricting the overall use that more modern CPUs can provide for the game's performance. This modification will change that.
echo.
echo Find the line 'seti cpuLevelUber' and change the numbers 2 and 1 to 3.
echo Please save and do not close the notepad!!!
pause

rem use more game shadows
echo.
cscript //nologo "../bootstrap/dialog.vbs" "By default, the game's shadows often appear very jagged. This modification will make them sharper and smoother\n\nFind the line 'TextureSizeThreshold' and press enter 3x.\nWithin the $High setting, change the value 2048 in the $ConfigGroup TextureSizeThreshold 2048 property to 4096. After modifying the file, simply save it."
echo By default, the game's shadows often appear very jagged. This modification will make them sharper and smoother
echo.
pause
echo Find the line 'TextureSizeThreshold' and press enter 3x.
echo Within the $High setting, change the value 2048 in the $ConfigGroup TextureSizeThreshold 2048 property to 4096. After modifying the file, simply save it.
echo.

rem Improving the Texture Quality of Sims.
cscript //nologo "../bootstrap/dialog.vbs" "Improving the Texture Quality of Sims.\n\nLocate 'SimQuality', then scroll down to the Setting $VeryHigh and change the prop $ConfigGroup RenderSimTextureSizes '2048, 2048, 512, 128' to prop $ConfigGroup RenderSimTextureSizes '4096, 4096, 512, 128'. Do the same for prop $ConfigGroup CASLightMapWidth 1024, changing it to prop $ConfigGroup CASLightMapWidth 4096, and prop $ConfigGroup CASRenderTargetSize 2048, changing it to prop $ConfigGroup CASRenderTargetSize 4096. After making these changes, simply save the file."
echo.
echo Improving the Texture Quality of Sims.
echo.

echo Locate 'SimQuality', then scroll down to the Setting $VeryHigh and change the prop $ConfigGroup RenderSimTextureSizes "2048, 2048, 512, 128" to prop $ConfigGroup RenderSimTextureSizes "4096, 4096, 512, 128". Do the same for prop $ConfigGroup CASLightMapWidth 1024, changing it to prop $ConfigGroup CASLightMapWidth 4096, and prop $ConfigGroup CASRenderTargetSize 2048, changing it to prop $ConfigGroup CASRenderTargetSize 4096. After making these changes, simply save the file.

pause

rem Fixing and enhancing the game's fog.
cscript //nologo "../bootstrap/dialog.vbs" "Fixing and enhancing the game's fog.\n\nOk, this modification is too large to explain here, so I'll open a manual for you"
echo.
echo Fixing and enhancing the game's fog.
echo.

echo Ok, this modification is too large to explain here, so I'll open a manual for you

start /WAIT "" "%cd%\bootstrap\enhance_fog.txt"

rem Fixing bloom fx
cscript //nologo "../bootstrap/dialog.vbs" "Fixing bloom fx\n\nFind 'AdvancedRendering' and press Enter. Then copy the line prop $ConfigGroup RenderPostProcessEnabled false from the $Off Setting and paste it into the $On Setting section underneath the line prop $ConfigGroup RenderForceMinspecShaders 0, maintaining the correct spacing."
echo.
echo Fixing bloom fx
echo.

echo Find 'AdvancedRendering' and press Enter. Then copy the line prop $ConfigGroup RenderPostProcessEnabled false from the $Off Setting and paste it into the $On Setting section underneath the line prop $ConfigGroup RenderForceMinspecShaders 0, maintaining the correct spacing.
pause

echo.
pause