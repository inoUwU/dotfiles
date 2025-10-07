#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/dotfiles/nixos"
WAYBAR_DIR="$HOME/dotfiles/waybar"

echo "Linking NixOS system configs..."
sudo ln -sf "$DOTFILES_DIR/configuration.nix" /etc/nixos/configuration.nix
sudo ln -sf "$DOTFILES_DIR/hardware-configuration.nix" /etc/nixos/hardware-configuration.nix

echo "Linking Home Manager config..."
mkdir -p ~/.config/home-manager
ln -sf "$DOTFILES_DIR/home.nix" ~/.config/home-manager/home.nix


sudo ln -sf "$WAYBAR_DIR/config" ~/.config/waybar/config
sudo ln -sf "$WAYBAR_DIR/style.css" ~/.config/waybar/style.css


echo "All symlinks updated!"
