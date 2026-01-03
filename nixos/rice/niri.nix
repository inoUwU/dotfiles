{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.niri.homeModules.niri
    ./niri/startup.nix
    ./niri/keybinds.nix
    ./niri/layout.nix
    ./niri/windowrules.nix
    ./niri/layerrules.nix
    ./niri/animations.nix
    ./niri/overview.nix
  ];

  programs.niri = {
    enable = true;
    settings = {
      prefer-no-csd = true;
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      hotkey-overlay.skip-at-startup = true;
      environment = {
        NIXOS_OZONE_WL = "1";
      };
      cursor = {
        hide-after-inactive-ms = 60000;
        hide-when-typing = true;
        theme = "catppuccin-frappe-dark-cursors";
        size = 22;
      };
    };
  };
}
