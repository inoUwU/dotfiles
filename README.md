# dotfiles

my dotfiles / 私のdotfiles設定ファイル

## 概要 / Overview

このリポジトリには、以下のアプリケーションの設定ファイルが含まれています。

This repository contains configuration files for the following applications:

| アプリケーション / Application | 設定ファイル / Config File |
|-------------------------------|---------------------------|
| Neovim | `nvim/` |
| tmux | `.tmux.conf` |
| Vim | `.vimrc` |
| Alacritty | `alacritty.toml` |
| Ghostty | `ghostty/` |
| Starship | `starship.toml` |
| lazygit | `lazygit/` |
| NixOS | `nixos/` |

## 必要条件 / Requirements

- Git
- Bash
- 対象アプリケーション（Neovim、tmux等）

### Neovim

- Neovim 0.9以上 / Neovim 0.9+
- Nerd Font（MesloLGM Nerd Font推奨）

### その他 / Others

- xsel（tmuxのクリップボード連携用）
- Node.js、yarn（一部プラグイン用）

## インストール / Installation

### 1. リポジトリのクローン / Clone the repository

```bash
cd ~
git clone https://github.com/inoUwU/dotfiles.git
```

### 2. セットアップスクリプトの実行 / Run the setup script

#### Linux/macOS

```bash
cd ~/dotfiles
chmod +x setup.sh
./setup.sh
```

このスクリプトは以下のシンボリックリンクを作成します:

This script creates the following symbolic links:

- `nvim/` → `~/.config/nvim`
- `starship.toml` → `~/.config/starship.toml`
- `ghostty/` → `~/.config/ghostty`

#### NixOS

NixOS環境では、以下のコマンドを使用してください:

For NixOS, use the following command:

```bash
cd ~/dotfiles
chmod +x nixlink.sh
./nixlink.sh
```

#### Windows

Neovimの設定をWindowsに登録する場合（管理者権限不要）:

To register Neovim config on Windows (no admin required):

```bat
nvim_link_win.bat
```

このスクリプトはユーザー環境変数 `XDG_CONFIG_HOME` をWindowsレジストリ (`HKCU\Environment`) に設定します。Neovim は `%XDG_CONFIG_HOME%\nvim` をコンフィグとして使用します。実行後はターミナルを再起動してください。

This script sets the user environment variable `XDG_CONFIG_HOME` in the Windows Registry (`HKCU\Environment`). Neovim will use `%XDG_CONFIG_HOME%\nvim` as its config directory. Restart your terminal after running.

### 3. 手動でリンクが必要なファイル / Files requiring manual linking

以下のファイルは手動でシンボリックリンクを作成する必要があります:

The following files need to be manually linked:

```bash
# tmux
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# Alacritty
mkdir -p ~/.config/alacritty
ln -sf ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

# lazygit
mkdir -p ~/.config/lazygit
ln -sf ~/dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml
```

## キーバインド / Key Bindings

### tmux

| キー / Key | 説明 / Description |
|-----------|---------------------|
| `Ctrl-s` | プレフィックスキー / Prefix key |
| `Prefix + h/j/k/l` | ペイン移動（Vim風） / Pane navigation (Vim-like) |
| `Alt + 矢印キー` | ペインリサイズ / Pane resize |

> **Note**: `Ctrl-s`がターミナルのフロー制御と競合する場合は、`stty -ixon`を実行してください。
>
> If `Ctrl-s` conflicts with terminal flow control, run `stty -ixon`.

### Neovim

| キー / Key | 説明 / Description |
|-----------|---------------------|
| `Space` | リーダーキー / Leader key |

### lazygit

| キー / Key | 説明 / Description |
|-----------|---------------------|
| `Ctrl-c` | コミットメッセージフォーマット / Commit with format |

## カスタマイズ / Customization

各設定ファイルは個人の好みに合わせて編集できます。

Each configuration file can be edited to suit your preferences.

## ライセンス / License

MIT
