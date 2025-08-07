# Monster-Hunter-Wilds-開啟遊戲前自動備份存檔（適用於 Steam）

此腳本會在你啟動遊戲前，自動備份《Monster Hunter Wilds》的遊戲存檔。

## 🌐 Available Languages

- [English (EN)](README.md)
- [中文 (Chinese)](README_CH.md)
- [日本語 (Japanese)](README_JP.md)


## 設定說明：
-------------------

1. 手動找到你的存檔資料夾路徑：
   - 前往：`C:\Program Files (x86)\Steam\userdata\`
   - 開啟名稱為你的 Steam ID 的資料夾（通常是一串數字）。
   - 然後開啟該遊戲的資料夾（例如 Monster Hunter Wilds 的遊戲 ID 是 `2246340`）。
   - 完整的存檔路徑會像這樣：
     `C:\Program Files (x86)\Steam\userdata\123456789\2246340\remote\win64_save`

2. 用文字編輯器開啟 `backup_savedata.bat`，並修改以下三行（大約在第 63、66、69 行）：
       set "sourceDir=..."   （你的存檔資料夾）
       set "backupDir=..."   （備份 zip 檔案儲存的位置）
       set "logFile=..."     （選填，記錄備份日誌的路徑）

3. 開啟 Steam 並找到你的收藏庫。

4. 右鍵點擊遊戲（例如 Monster Hunter Wilds），然後選擇「內容」。

5. 在「啟動選項」欄位中貼上以下指令：
   > ※請將 .bat 路徑替換成你實際的檔案路徑。

         powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& {Start-Process 'C:\your\path\to\backup_savedata.bat' -Wait}"; %command%

   - 如果你的 Steam 安裝在預設路徑，範例可能如下：
     C:\Program Files (x86)\Steam\userdata\123456789\2246340\remote\backup_savedata.bat

## 此腳本的功能：
-----------------------

- 在遊戲啟動之前執行備份腳本。
- 將你當前的存檔資料夾壓縮成一個 zip 檔案。
- 備份完成後，自動繼續啟動遊戲。

## 注意事項：
----------------

- 各人電腦的資料夾路徑可能不同，請務必正確設定 `.bat` 檔內的路徑。
- 請勿在 `.bat` 檔中加入 `pause` 等會中斷流程、等待按鍵的指令。
- 腳本會在背景靜默執行，不會顯示視窗。
- 請確保你設定的所有路徑實際存在。

## 免責聲明：
-----------

本工具以「原樣」提供，可能不適用於所有情況。  
作者對於因使用此工具而導致的檔案遺失或損壞不負任何責任。  
**在首次使用或測試前，請務必手動備份你的遊戲存檔。**  
建議先多次測試確認在你的系統上能正常運作。
