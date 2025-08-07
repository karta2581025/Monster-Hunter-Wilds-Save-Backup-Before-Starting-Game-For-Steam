:: === Readme ================================================================================================
:: Game Save Backup Before Starting Game (For Steam)
:: ================================================================================================

:: This script automatically backs up your game save files before the game starts.

:: Setup Instructions:
:: -------------------
:: 1. Manually find your save folder path:
::    - Go to: C:\Program Files (x86)\Steam\userdata\
::    - Open the folder named after your Steam ID (a number).
::    - Then open the folder named after the game ID (e.g., 2246340 for Monster Hunter Wilds).
::    - Your full save path will look like:
::        C:\Program Files (x86)\Steam\userdata\123456789\2246340\remote\win64_save

:: 2. Open "backup_savedata.bat" in a text editor and modify the following lines:
::    (Lines 63, 66, and 69)
::        set "sourceDir=..."   (your save folder)
::        set "backupDir=..."   (where the backup .zip will be saved)
::        set "logFile=..."     (optional path to save the log file)

:: 3. Open Steam and go to your game list.

:: 4. Right-click the game (e.g., Monster Hunter Wilds), then choose "Properties".

:: 5. In the "Launch Options" field, paste the following line:
::    (replace the .bat path with your actual file path)

:: powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& {Start-Process 'C:\your\path\to\backup_savedata.bat' -Wait}"; %command%

::    - If Steam is installed in the default location, the path may look like:
::      C:\Program Files (x86)\Steam\userdata\123456789\2246340\remote\backup_savedata.bat

:: What this script does:
:: -----------------------
:: - It runs a script before the game starts.
:: - The script creates a zip file of your current save data.
:: - Then Steam launches the game as usual.

:: Important Notes:
:: ----------------
:: - Your folder paths may be different. Please update the .bat file accordingly.
:: - Do not include "pause" or anything that waits for key input in the .bat script.
:: - The script runs silently with no visible window.
:: - Make sure the paths you set actually exist.

:: Disclaimer:
:: -----------
:: This tool is provided as-is. It may not work in all cases.
:: The author is not responsible for lost or damaged files.
:: **Before using or testing this script, manually back up your save data.**
:: Always test a few times to ensure it works correctly on your system.

:: === CODE ================================================================================================



@echo off
setlocal EnableDelayedExpansion

:: === Configuration ===
:: The folder where your game saves are (the stuff you want to back up) ex: C:\Program Files (x86)\Steam\userdata\123456789\2246340\remote\win64_save
set "sourceDir=E:\Game\Steam\userdata\356590741\2246340\remote\win64_save"

:: The folder where the backup zip file will go (where you store the copy) ex: C:\Program Files (x86)\Steam\userdata\123456789\2246340\remote\
set "backupDir=E:\Game\Steam\userdata\356590741\2246340\remote"

:: A text file that keeps track of backup results (success or error)
set "logFile=%backupDir%\backup_log.txt"

:: === Get timestamp for filename ===
for /f %%a in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMddHHmm"') do set "timestamp=%%a"
set "zipName=win64_save_%timestamp%.zip"
set "zipPath=%backupDir%\%zipName%"

:: === Get clean timestamp for log ===
set "rawTime=%time: =0%"
set "rawTime=%rawTime::=%"
set "rawTime=%rawTime:.=%"
for /f "tokens=1 delims= " %%a in ("%date%") do set "cleanDate=%%a"
set "logTime=%cleanDate% %rawTime%"

:: === Ensure backupDir exists ===
if not exist "%backupDir%" (
    echo [%logTime%] Backup target directory does not exist: %backupDir% >> "%logFile%"
    goto :EOF
)

:: === Perform backup ===
if exist "%sourceDir%" (
    powershell -NoProfile -Command ^
        "Compress-Archive -Path '%sourceDir%' -DestinationPath '%zipPath%' -Force" 2>nul

    if exist "%zipPath%" (
        echo [%logTime%] Backup successful: %zipPath% >> "%logFile%"
    ) else (
        echo [%logTime%] Backup failed: Archive file was not created >> "%logFile%"
    )
) else (
    echo [%logTime%] Source directory does not exist: %sourceDir% >> "%logFile%"
)

endlocal
exit

:: ===========================================================================================================
