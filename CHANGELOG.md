# 変更履歴 / Changelog

## [未リリース] - Windows セットアップのレジストリ対応

### 変更の背景

これまでの `nvim_link_win.bat` は、Windowsの `mklink /D` コマンドを使ってディレクトリのシンボリックリンクを作成していました。  
しかし、Windowsでシンボリックリンクを作成するには**管理者権限（Administrator）** が必要であり、一般ユーザーが手軽に実行できないという問題がありました。

### 何を変えたか

| 項目 | 変更前 | 変更後 |
|------|--------|--------|
| 方式 | `mklink /D` によるシンボリックリンク作成 | `reg add` によるレジストリへの環境変数登録 |
| 管理者権限 | **必要** | **不要** |
| 設定先 | `C:\Users\<ユーザー名>\AppData\Local\nvim` にシンボリックリンクを作成 | `HKCU\Environment` に `XDG_CONFIG_HOME` を登録 |

### 変更の詳細

#### `nvim_link_win.bat`

**変更前:**
```bat
set "source=%cd%\nvim"
set "link=C:\Users\%USERNAME%\AppData\Local\nvim"
mklink /D "%link%" "%source%"
```

**変更後:**
```bat
set "dotfiles_dir=%cd%"
reg add "HKCU\Environment" /v "XDG_CONFIG_HOME" /t REG_SZ /d "%dotfiles_dir%" /f
```

- `mklink /D` の代わりに `reg add` を使い、Windowsレジストリのユーザー環境変数 `HKCU\Environment` に `XDG_CONFIG_HOME` を登録するようにしました。
- `XDG_CONFIG_HOME` にdotfilesのルートディレクトリ（`%cd%`）を設定することで、Neovimは自動的に `%XDG_CONFIG_HOME%\nvim` をコンフィグディレクトリとして認識します。
- `HKCU`（HKEY_CURRENT_USER）への書き込みは現在のユーザー範囲のみに影響するため、**管理者権限なしで実行可能**です。
- エラーハンドリングを追加し、`reg add` の成功・失敗に応じてメッセージを表示するようにしました。
- 設定反映にはターミナルの再起動が必要なため、その旨をメッセージで案内するようにしました。

#### `README.md`

- Windowsセクションの説明文を更新し、シンボリックリンクではなくレジストリを使う方式であることを明記しました。
- 管理者権限が不要であること、および実行後にターミナルの再起動が必要なことを補足しました。

### なぜ `XDG_CONFIG_HOME` を使うのか

Neovim は [XDG Base Directory 仕様](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html) に対応しており、`XDG_CONFIG_HOME` が設定されている場合はその配下の `nvim` フォルダをコンフィグとして使用します。  
Windowsでも同様に機能するため、シンボリックリンクを使わずとも任意の場所にあるdotfilesを直接参照させることができます。

### 使い方（変更後）

1. dotfilesリポジトリのルートディレクトリで `nvim_link_win.bat` を実行します。
2. 完了後、ターミナル（PowerShell・コマンドプロンプト等）を再起動します。
3. Neovimを起動すると、dotfilesリポジトリ内の `nvim/` フォルダが自動的にコンフィグとして読み込まれます。
