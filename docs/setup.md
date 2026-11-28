# 環境を戻す

初回は `git clone https://github.com/inoUwU/dotfiles.git ~/dotfiles`。以後は `~/dotfiles` で `git pull --ff-only`。以下のコマンドもそこで実行する。

## macOS

ZeroBrew で `zb install mise`。`~/.zshrc` に `eval "$(mise activate zsh)"` を入れる。`navi` のビルドには Rust/Cargo が必要。

```sh
mise exec chezmoi@2.74.2 -- chezmoi --source . init
mise exec chezmoi@2.74.2 -- chezmoi --source . diff
```

差分を見て、上書きしたくないファイルは退避。旧 symlink はリンク先ではなくリンク自体を移す。

```sh
mise exec chezmoi@2.74.2 -- chezmoi --source . apply
MISE_CARGO_BINSTALL=false mise install
```

`mise/macos.toml` は `~/.config/mise/conf.d/40-macos.toml` に入る。`config.toml` と指定が重なったら `mise ls --current` で確認。

## Linux / Windows

Fedora は `sudo dnf install chezmoi`、Arch は `sudo pacman -S chezmoi`、Windows は `scoop install chezmoi`。[その他のインストール方法](https://www.chezmoi.io/install/)。

```sh
chezmoi --source . init
chezmoi --source . diff
# 差分を確認し、既存ファイルを退避してから反映
chezmoi --source . apply
chezmoi --source . status
```

`init` だけではアプリの設定は変わらない。旧 Neovim・Starship 用の設定が残っている場合も `init` で配置基準をホームに戻す。`status` が空なら反映済み。

## アプリ側の依存

- chezmoi が配置するのは設定だけ。Neovim 用には Nerd Font（MesloLGM）と `cargo install tree-sitter-cli`。一部プラグインには Node.js と yarn。
- Linux で tmux からクリップボードへコピーするには `xsel`。
