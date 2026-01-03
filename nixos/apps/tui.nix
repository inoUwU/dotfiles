{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    numbat
    bottom
    microfetch
    lazygit
    lazydocker
    bluetuith
    rofi
  ];

  programs.bottom.enable = true;
  programs.numbat.enable = true;
}
