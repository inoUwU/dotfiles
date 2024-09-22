@echo off
REM カレントディレクトリの nvim フォルダをリンクするバッチファイル

REM カレントディレクトリの nvim フォルダ
set "source=%cd%\nvim"

REM ユーザの AppData\Local にリンクを作成
set "link=C:\Users\%USERNAME%\AppData\Local\nvim"

REM シンボリックリンクを作成 (/D オプションはディレクトリ用)
mklink /D "%link%" "%source%"

echo シンボリックリンクが作成されました。
pause
