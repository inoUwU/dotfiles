#!/bin/bash
# dotfilesのルートディレクトリ
DOTFILES_DIR="$HOME/dotfiles"

# Neovimの設定ファイルのパス
NEOVIM_CONFIG_DIR="$HOME/.config/nvim"

# StarShipの設定ファイルのパス
STARSHIP_CONFIG_DIR="$HOME/.config/starship.toml"

# シンボリックリンクを作成する関数
create_symlink() {
    src="$1"
    dest="$2"

    if [ -e "$dest" ]; then
        if [ -L "$dest" ]; then
            # 既存のシンボリックリンクを削除
            rm "$dest"
        else
            # バックアップを作成
            mv "$dest" "${dest}_bak_$(date +%Y%m%d%H%M%S)"
        fi
    fi

    # シンボリックリンクを作成
    ln -s "$DOTFILES_DIR/$src" "$dest"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create symlink for $src -> $dest"
        exit 1
    fi
}

# Neovimの設定をリンク
create_symlink "nvim" "$NEOVIM_CONFIG_DIR"

# StarShipの設定をリンク
create_symlink "starship.toml" "$STARSHIP_CONFIG_DIR"

