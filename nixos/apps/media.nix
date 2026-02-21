{ pkgs, ... }:

{
  home.packages = with pkgs; [
    spotify
    bluetuith
  ];

  programs.rofi.enable = true;
}
