#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/dotfiles/nixos"

echo "Linking NixOS system configs..."
sudo ln -sf "$DOTFILES_DIR/configuration.nix" /etc/nixos/configuration.nix
sudo ln -sf "$DOTFILES_DIR/hardware-configuration.nix" /etc/nixos/hardware-configuration.nix

echo "Linking Home Manager config..."
mkdir -p ~/.config/home-manager
ln -sf "$DOTFILES_DIR/home.nix" ~/.config/home-manager/home.nix

echo "All symlinks updated!"
