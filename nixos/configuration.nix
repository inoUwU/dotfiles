# このconfigurationファイルを編集してシステムにインストールするものを定義します。
# ヘルプは configuration.nix(5) の man page と
# NixOS manual ('nixos-help'を実行してアクセス可能) で利用できます。

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # hardware scanの結果を含める
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
      ./host/host-configuration.nix
      ./hw/hw.nix
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "ino" = import ./home.nix;
    };
    backupFileExtension = "bak";
  };

  # State Version
  system.stateVersion = "24.11"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

