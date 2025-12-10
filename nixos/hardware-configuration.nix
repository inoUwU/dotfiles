# このファイルを変更しないでください！これは 'nixos-generate-config' によって生成され、
# 将来の実行で上書きされる可能性があります。変更を加える場合は
# 代わりに /etc/nixos/configuration.nix に行ってください。
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/0947d958-3dd9-4cb6-a90d-19c5164ecc6b";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/EEB9-8188";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  # 各ethernetおよびwireless interfaceでDHCPを有効化します。scriptedネットワーキング
  # (デフォルト) の場合、これが推奨されるアプローチです。systemd-networkdを使用する場合でも
  # このオプションを使用できますが、`networking.interfaces.<interface>.useDHCP` で
  # 明示的なインターフェースごとの宣言と併用することが推奨されます。
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
