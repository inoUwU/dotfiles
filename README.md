# dotfiles

my dotfiles / 私のdotfiles設定ファイル

## 概要 / Overview

このリポジトリには、以下のアプリケーションの設定ファイルが含まれています。

This repository contains configuration files for the following applications:

| アプリケーション / Application | 設定ファイル / Config File |
| ------------------------------ | -------------------------- |
| Neovim                         | `nvim/`                    |
| tmux                           | `.tmux.conf`               |
| Vim                            | `.vimrc`                   |
| Alacritty                      | `alacritty.toml`           |
| Ghostty                        | `ghostty/`                 |
| Starship                       | `starship.toml`            |
| WezTerm                        | `wezterm/`                 |
| lazygit                        | `lazygit/`                 |
| NixOS                          | `nixos/`                   |

## 必要条件 / Requirements

- Git
- Bash
- 対象アプリケーション（Neovim、tmux等）

### Neovim

- Neovim 0.12以上 / Neovim 0.9+
- Nerd Font（MesloLGM Nerd Font推奨）
  `cargo install tree-sitter-cli`

### その他 / Others

- xsel（tmuxのクリップボード連携用）
- Node.js、yarn（一部プラグイン用）

## インストール / Installation

### 1. リポジトリのクローン / Clone the repository

```bash
cd ~
git clone https://github.com/inoUwU/dotfiles.git
```

### chezmoi で配布 / Deploy with chezmoi

[chezmoi](https://www.chezmoi.io/install/) をインストールし、このリポジトリのルートで実行します。以前の Neovim・Starship 向け設定から更新する場合も、先に `init` を実行して配置先の基準をホームディレクトリに戻してください。
Install [chezmoi](https://www.chezmoi.io/install/) and run these commands from the repository root. Run `init` again when upgrading from the earlier Neovim and Starship setup; the destination is now your home directory.

```sh
chezmoi --source . init
chezmoi --source . diff
chezmoi --source . apply
```

初回の `apply` の前に、差分を確認してください。置き換える既存ファイルはバックアップし、シンボリックリンクならリンク先ではなくリンク自体を別名に移してください。
Review the diff before the first apply. Back up files that will be replaced. For symlinks, rename the link itself, not the file or directory it points to.

| ツール / Tool | Linux | macOS | Windows |
| --- | --- | --- | --- |
| Neovim | `~/.config/nvim/` | `~/.config/nvim/` | `%LOCALAPPDATA%\nvim\` |
| Starship | `~/.config/starship.toml` | `~/.config/starship.toml` | `~\.config\starship.toml` |
| Vim | `~/.vimrc` | `~/.vimrc` | `~\_vimrc` |
| Alacritty | `~/.config/alacritty/` | `~/.config/alacritty/` | `%APPDATA%\alacritty\` |
| lazygit | `~/.config/lazygit/` | `~/Library/Application Support/lazygit/` | `%LOCALAPPDATA%\lazygit\`、既存の設定があれば `%APPDATA%\lazygit\` も使用 |
| WezTerm | `~/.config/wezterm/` | `~/.config/wezterm/` | `~\.config\wezterm\` |
| Ghostty | `~/.config/ghostty/` | `~/.config/ghostty/` | 配布しません / Not deployed |
| tmux | `~/.tmux.conf` | `~/.tmux.conf` | 配布しません / Not deployed |

表は既定の配置先です。対応する環境変数でホームディレクトリ内の別の場所を指定できます。Windows で以前の手順に従い `STARSHIP_CONFIG` を `%LOCALAPPDATA%\starship.toml` に設定した場合は、設定を外せば Starship の既定パスに戻せます。
The table lists default destinations. Supported environment overrides can select other paths within your home directory. If you previously set `STARSHIP_CONFIG` to `%LOCALAPPDATA%\starship.toml`, remove that override to return to Starship's default path.

編集はリポジトリ内の元ファイルで行ってください。chezmoi は適用のたびに元ファイルを読み込みます。Neovim が `lazy-lock.json` を更新した場合は、配置先のファイルをリポジトリにコピーして取り込みます。
Edit the source files in this repository. chezmoi reads them on every apply. When Neovim updates `lazy-lock.json`, copy the deployed file back into the repository to keep the update.

Alacritty は各 OS の既定のシェルを起動します。Windows で WSL を起動する場合は、`alacritty -e wsl.exe ~` を使えます。
Alacritty uses the OS default shell. On Windows, use `alacritty -e wsl.exe ~` to start WSL instead.

### 配布対象外 / Not deployed

`nixos/` と `maya_setup_en.bat` は OS やアプリの環境に固有のため、chezmoi の配布対象外です。
`nixos/` and `maya_setup_en.bat` remain outside chezmoi because they are specific to a system or application installation.

#### NixOS

NixOS環境では、以下のコマンドを使用してください:

For NixOS, use the following command:

```bash
cd ~/dotfiles
chmod +x nixlink.sh
./nixlink.sh
```

## キーバインド / Key Bindings

### tmux

| キー / Key         | 説明 / Description                               |
| ------------------ | ------------------------------------------------ |
| `Ctrl-s`           | プレフィックスキー / Prefix key                  |
| `Prefix + h/j/k/l` | ペイン移動（Vim風） / Pane navigation (Vim-like) |
| `Alt + 矢印キー`   | ペインリサイズ / Pane resize                     |

> **Note**: `Ctrl-s`がターミナルのフロー制御と競合する場合は、`stty -ixon`を実行してください。
>
> If `Ctrl-s` conflicts with terminal flow control, run `stty -ixon`.

### Neovim

| キー / Key | 説明 / Description        |
| ---------- | ------------------------- |
| `Space`    | リーダーキー / Leader key |

### lazygit

| キー / Key | 説明 / Description                                  |
| ---------- | --------------------------------------------------- |
| `Ctrl-c`   | コミットメッセージフォーマット / Commit with format |

## カスタマイズ / Customization

各設定ファイルは個人の好みに合わせて編集できます。

Each configuration file can be edited to suit your preferences.

## ライセンス / License

MIT
