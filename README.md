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
| Nushell                        | `nushell/`                  |
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

### リポジトリの取得・更新 / Clone or update the repository

```bash
cd ~
git clone https://github.com/inoUwU/dotfiles.git
cd ~/dotfiles
```

すでにクローンしている場合は、既存のリポジトリのルートで `git pull --ff-only` を実行してください。
If you already have a clone, run `git pull --ff-only` from its root instead.

## chezmoi

chezmoi は、このリポジトリの設定ファイルを各 OS の配置先にコピーします。アプリ本体は別途インストールしてください。
chezmoi copies configuration files from this repository to each OS's destination paths. Install the applications separately.

### chezmoi のインストール / Install chezmoi

| 環境 / Platform | コマンド / Command |
| --- | --- |
| macOS（Homebrew） | `brew install chezmoi` |
| Fedora | `sudo dnf install chezmoi` |
| Arch Linux | `sudo pacman -S chezmoi` |
| Windows（Scoop） | `scoop install chezmoi` |

macOS ではリポジトリのルートで次を実行します。`navi` のビルドには Rust/Cargo が必要です。
On macOS, run the following from the repository root. Building `navi` requires Rust/Cargo.

```sh
mise exec chezmoi@2.74.2 -- chezmoi --source . init
mise exec chezmoi@2.74.2 -- chezmoi --source . diff
mise exec chezmoi@2.74.2 -- chezmoi --source . apply
MISE_CARGO_BINSTALL=false mise install
```

`mise/macos.toml` は macOS のみ `~/.config/mise/conf.d/40-macos.toml` に配置されます。`config.toml` は置き換えません。同じツールが両方にある場合は `mise ls --current` で有効な指定を確認してください。zsh では `~/.zshrc` に `eval "$(mise activate zsh)"` が必要です。
The macOS tool list is deployed alongside your existing mise config. Check overlapping pins with `mise ls --current` and enable mise in zsh as shown above.

ほかの環境や、パッケージが見つからない場合は、[chezmoi 公式のインストール手順](https://www.chezmoi.io/install/)を参照してください。
For other platforms or if the package is unavailable, see the [official chezmoi installation guide](https://www.chezmoi.io/install/).

### 初期化と差分の確認 / Initialize and preview

リポジトリのルートで実行してください。以前の Neovim・Starship 向け設定から更新する場合も、配置先の基準をホームディレクトリに戻すために `init` を再実行してください。
Run these commands from the repository root. If you are upgrading from the earlier Neovim and Starship setup, rerun `init` to reset the base destination to your home directory.

```sh
chezmoi --source . init
chezmoi --source . diff
```

`init` は chezmoi 自体の設定を初期化します。何も表示せずに終了する場合があります。アプリの設定ファイルは `apply` まで変更されません。
`init` initializes chezmoi's own configuration and may exit without printing anything. It does not change application files until you run `apply`.

### 適用と確認 / Apply and verify

`diff` で変更を確認し、置き換える既存ファイルをバックアップしてください。旧セットアップで作成したシンボリックリンクが残っている場合は、リンク先ではなくリンク自体を別名に移してください。
Review `diff` and back up files that will be replaced. If symlinks from the old setup remain, rename the links themselves, not the files or directories they point to.

```sh
chezmoi --source . apply
chezmoi --source . status
```

`status` に何も表示されなければ、未適用の差分はありません。
If `status` prints nothing, there are no pending changes.

### 配置先 / Destinations

| ツール / Tool | Linux | macOS | Windows |
| --- | --- | --- | --- |
| Neovim | `~/.config/nvim/` | `~/.config/nvim/` | `%LOCALAPPDATA%\nvim\` |
| Starship | `~/.config/starship.toml` | `~/.config/starship.toml` | `~\.config\starship.toml` |
| Vim | `~/.vimrc` | `~/.vimrc` | `~\_vimrc` |
| Alacritty | `~/.config/alacritty/` | `~/.config/alacritty/` | `%APPDATA%\alacritty\` |
| lazygit | `~/.config/lazygit/` | `~/Library/Application Support/lazygit/` | `%LOCALAPPDATA%\lazygit\`、既存の設定があれば `%APPDATA%\lazygit\` も使用 |
| WezTerm | `~/.config/wezterm/` | `~/.config/wezterm/` | `~\.config\wezterm\` |
| Nushell (`repos`, `lg`) | 配布しません / Not deployed | 配布しません / Not deployed | `%APPDATA%\nushell\autoload\` (`repos.nu`, `aliases.nu`) |
| Ghostty | `~/.config/ghostty/` | `~/.config/ghostty/` | 配布しません / Not deployed |
| tmux | `~/.tmux.conf` | `~/.tmux.conf` | 配布しません / Not deployed |

表は既定の配置先です。対応する環境変数でホームディレクトリ内の別の場所を指定できます。Windows で以前の手順に従い `STARSHIP_CONFIG` を `%LOCALAPPDATA%\starship.toml` に設定した場合は、設定を外せば Starship の既定パスに戻せます。
The table lists default destinations. Supported environment overrides can select other paths within your home directory. If you previously set `STARSHIP_CONFIG` to `%LOCALAPPDATA%\starship.toml`, remove that override to return to Starship's default path.

編集はリポジトリ内の元ファイルで行ってください。chezmoi は適用のたびに元ファイルを読み込みます。Neovim が `lazy-lock.json` を更新した場合は、配置先のファイルをリポジトリにコピーして取り込みます。
Edit the source files in this repository. chezmoi reads them on every apply. When Neovim updates `lazy-lock.json`, copy the deployed file back into the repository to keep the update.

Windows では、`ghq` と `fzf` をインストールしてから、新しい Nushell で `repos` を実行すると、リポジトリを選んで移動できます。以前 `config.nu` に `repos` を定義していた場合は、その定義だけ削除してください。`ghq.root`（探索と新規クローンの起点）は端末側の Git 設定で管理します。
On Windows, install `ghq` and `fzf`, then run `repos` in a new Nushell session to select and open a repository directory. If `config.nu` already defines `repos`, remove only that definition. Keep `ghq.root`, the directory used to find and clone repositories, in your machine's Git configuration.

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
