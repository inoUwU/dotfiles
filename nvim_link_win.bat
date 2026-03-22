@echo off
REM カレントディレクトリの nvim フォルダを Neovim の設定として登録するバッチファイル
REM レジストリにユーザー環境変数を設定するため管理者権限は不要です

REM カレントディレクトリ (dotfiles のルート) を取得
set "dotfiles_dir=%cd%"

REM ユーザー環境変数 XDG_CONFIG_HOME をレジストリに設定 (管理者権限不要)
reg add "HKCU\Environment" /v "XDG_CONFIG_HOME" /t REG_SZ /d "%dotfiles_dir%" /f

if errorlevel 1 (
    echo エラー: XDG_CONFIG_HOME の設定に失敗しました。
) else (
    echo XDG_CONFIG_HOME が %dotfiles_dir% に設定されました。
    echo Neovim は %dotfiles_dir%\nvim をコンフィグとして使用します。
    echo 変更を反映するには、ターミナルを再起動するか、ログアウトして再度ログインしてください。
)
pause
