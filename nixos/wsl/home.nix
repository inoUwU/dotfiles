# WSL向けHome Manager設定
# rice (Niri / Hyprland / Noctalia / Vicinae) は除外しています

{ config, pkgs, inputs, lib, ... }:

{
  home.username = "ino";
  home.homeDirectory = "/home/ino";

  imports = [
    ../apps/tui.nix
    ../apps/zsh.nix
    ../apps/starship.nix
  ];

  home.stateVersion = "24.05";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = [
    pkgs.nixfmt-rfc-style
  ];

  home.file = { };

  home.sessionVariables = { };

  # Home Manager自身をインストールして管理させます
  programs.home-manager.enable = true;
}
