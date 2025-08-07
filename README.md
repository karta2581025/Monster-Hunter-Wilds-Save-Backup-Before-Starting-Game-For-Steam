# Monster-Hunter-Wilds-Save-Backup-Before-Starting-Game-For-Steam
This script automatically backs up your game save files before the game starts.

## 🌐 Available Languages

- [English (EN)](README.md)
- [中文 (Chinese)](README_CH.md)
- [日本語 (Japanese)](README_JP.md)



Setup Instructions:
-------------------
1. Manually find your save folder path:
   - Go to: C:\Program Files (x86)\Steam\userdata\
   - Open the folder named after your Steam ID (a number).
   - Then open the folder named after the game ID (e.g., 2246340 for Monster Hunter Wilds).
   - Your full save path will look like:
       'C:\Program Files (x86)\Steam\userdata\123456789\2246340\remote\win64_save'

2. Open "backup_savedata.bat" in a text editor and modify the following lines:
   (Lines 63, 66, and 69)
      set "sourceDir=..."   (your save folder)
   
      set "backupDir=..."   (where the backup .zip will be saved)
   
      set "logFile=..."     (optional path to save the log file)


4. Open Steam and go to your game list.

5. Right-click the game (e.g., Monster Hunter Wilds), then choose "Properties".

6. In the "Launch Options" field, paste the following line:
   (replace the .bat path with your actual file path)


         powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& {Start-Process 'C:\your\path\to\backup_savedata.bat' -Wait}"; %command%
   

   - If Steam is installed in the default location, the path may look like:
     C:\Program Files (x86)\Steam\userdata\123456789\2246340\remote\backup_savedata.bat

What this script does:
-----------------------
- It runs a script before the game starts.
- The script creates a zip file of your current save data.
- Then Steam launches the game as usual.

Important Notes:
----------------
- Your folder paths may be different. Please update the .bat file accordingly.
- Do not include "pause" or anything that waits for key input in the .bat script.
- The script runs silently with no visible window.
- Make sure the paths you set actually exist.

Disclaimer:
-----------
This tool is provided as-is. It may not work in all cases.
The author is not responsible for lost or damaged files.
**Before using or testing this script, manually back up your save data.**
Always test a few times to ensure it works correctly on your system.

