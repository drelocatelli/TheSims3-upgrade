@echo off
setlocal enabledelayedexpansion

echo This is a risky modification! Different people report different experiences with this modification. I will create one more backup folder inside this upgrade folder for you.

echo.
pause

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
echo.

rem Replace Default.ini
set "file=%gamePath%\Bin\Default.ini"
set "find=HeapSize"
set "replace=HeapSize = 15360"

(for /f "tokens=*" %%a in ('type "%file%"') do (
    set "line=%%a"
    if "!line!" == "!line:%find%=%!" (
        echo %%a
    ) else (
        set "line=%replace%!"
        echo !line!
    )
)) > "%file%.new"

move /y "%file%.new" "%file%" > nul

echo .

rem Replace Default.ini
set "file=%gamePath%\Bin\Default.ini"
set "find=CacheBudget"
set "replace=CacheBudget = 104857600"

(for /f "tokens=*" %%a in ('type "%file%"') do (
    set "line=%%a"
    if "!line!" == "!line:%find%=%!" (
        echo %%a
    ) else (
        set "line=%replace%!"
        echo !line!
    )
)) > "%file%.new"

move /y "%file%.new" "%file%" > nul

echo .

rem Replace Default.ini
set "file=%gamePath%\Bin\Default.ini"
set "find=BlockSize"
set "replace=BlockSize=15360"

(for /f "tokens=*" %%a in ('type "%file%"') do (
    set "line=%%a"
    if "!line!" == "!line:%find%=%!" (
        echo %%a
    ) else (
        set "line=%replace%!"
        echo !line!
    )
)) > "%file%.new"

move /y "%file%.new" "%file%" > nul

echo .

rem Replace Default.ini
set "file=%gamePath%\Bin\Default.ini"
set "find=CompositorCacheSize"
set "replace=CompositorCacheSize = 1310720000"

(for /f "tokens=*" %%a in ('type "%file%"') do (
    set "line=%%a"
    if "!line!" == "!line:%find%=%!" (
        echo %%a
    ) else (
        set "line=%replace%!"
        echo !line!
    )
)) > "%file%.new"

move /y "%file%.new" "%file%" > nul

echo .

rem Replace Default.ini
set "file=%gamePath%\Bin\Default.ini"
set "find=SimCompositorCacheSize"
set "replace=SimCompositorCacheSize = 1310720000"

(for /f "tokens=*" %%a in ('type "%file%"') do (
    set "line=%%a"
    if "!line!" == "!line:%find%=%!" (
        echo %%a
    ) else (
        set "line=%replace%!"
        echo !line!
    )
)) > "%file%.new"

move /y "%file%.new" "%file%" > nul

echo .

rem Replace Default.ini
set "file=%gamePath%\Bin\Default.ini"
set "find=WorldCompositorCacheSize"
set "replace=WorldCompositorCacheSize = 1310720000"

(for /f "tokens=*" %%a in ('type "%file%"') do (
    set "line=%%a"
    if "!line!" == "!line:%find%=%!" (
        echo %%a
    ) else (
        set "line=%replace%!"
        echo !line!
    )
)) > "%file%.new"

move /y "%file%.new" "%file%" > nul

echo .

rem Replace Default.ini
set "file=%gamePath%\Bin\Default.ini"
set "find=SimWorldCompositorCacheSize"
set "replace=SimWorldCompositorCacheSize = 1310720000"

(for /f "tokens=*" %%a in ('type "%file%"') do (
    set "line=%%a"
    if "!line!" == "!line:%find%=%!" (
        echo %%a
    ) else (
        set "line=%replace%!"
        echo !line!
    )
)) > "%file%.new"

move /y "%file%.new" "%file%" > nul



start /WAIT "notepad.exe" "%file%"

echo.
pause








echo.
pause