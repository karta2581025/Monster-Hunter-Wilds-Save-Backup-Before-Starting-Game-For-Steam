# Monster-Hunter-Wilds - ゲーム起動前にセーブデータを自動バックアップ（Steam用）

このスクリプトは、ゲームを起動する前に『モンスターハンター：ワイルズ』のセーブデータを自動でバックアップします。

## 🌐 Available Languages

- [English (EN)](README.md)
- [中文 (Chinese)](README_CH.md)
- [日本語 (Japanese)](README_JP.md)


## 設定手順：
-------------------

1. セーブフォルダのパスを手動で確認：
   - `C:\Program Files (x86)\Steam\userdata\` に移動
   - 自分の Steam ID（数字）のフォルダを開く
   - ゲームIDのフォルダを開く（例：Monster Hunter Wilds のIDは `2246340`）
   - フルパスの例：
     `C:\Program Files (x86)\Steam\userdata\123456789\2246340\remote\win64_save`

2. `backup_savedata.bat` をテキストエディタで開き、以下の3行を編集（63、66、69行目あたり）：
```
set "sourceDir=..."   （セーブフォルダのパス）
set "backupDir=..."   （バックアップ zip の保存先）
set "logFile=..."     （任意：ログファイルの保存先）
```

3. Steam を起動し、ライブラリから対象のゲームを探す。

4. 対象ゲーム（例：Monster Hunter Wilds）を右クリック → 「プロパティ」を選択。

5. 「起動オプション」欄に以下のコマンドを貼り付ける：
   ※パスは実際の `.bat` ファイルの場所に変更してください。

```
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "& {Start-Process 'C:\your\path\to\backup_savedata.bat' -Wait}"; %command%
```

- Steam がデフォルトの場所にインストールされている場合、例：
  `C:\Program Files (x86)\Steam\userdata\123456789\2246340\remote\backup_savedata.bat`

## スクリプトの動作：
-----------------------

- ゲーム起動前にバッチスクリプトを実行します。
- セーブフォルダを zip に圧縮して保存します。
- バックアップ完了後、Steam によりゲームが通常通り起動します。

## 注意事項：
----------------

- 環境によってフォルダのパスが異なる場合があります。`.bat` ファイル内のパスを正しく設定してください。
- `.bat` に `pause` などキー入力待ちのコマンドを入れないでください。
- スクリプトはバックグラウンドで静かに実行され、ウィンドウは表示されません。
- 設定したすべてのパスが存在していることを事前に確認してください。

## 免責事項：
-----------

このツールは現状のまま提供され、すべての環境で動作を保証するものではありません。  
本ツールの使用によって発生したファイルの損失や破損について、作者は一切の責任を負いません。  
**使用やテストを行う前に、必ず手動でセーブデータをバックアップしてください。**  
複数回テストを行い、自分の環境で正しく動作することを確認することを推奨します。
