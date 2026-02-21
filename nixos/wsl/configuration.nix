# WSL向けNixOS設定
# NixOS-WSL (https://github.com/nix-community/NixOS-WSL) を使用します。
# 適用方法: nixos-rebuild switch --flake .#wsl

{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixos-wsl.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    ../host/user-settings.nix
  ];

  # WSL設定
  wsl = {
    enable = true;
    defaultUser = "ino";
  };

  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ino" = import ./home.nix;
    };
    backupFileExtension = "bak";
  };

  # 基本パッケージ (GUIなし)
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    neovim
    vim
    wget
    nixfmt-rfc-style
  ];

 programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];

  # State Version
  system.stateVersion = "24.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
