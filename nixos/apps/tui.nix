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
    waybar
  ];

  programs.bottom.enable = true;
  programs.numbat.enable = true;

	programs.waybar.enable = true;
	xdg.configFile."waybar/config".source = ./waybar/config;
	xdg.configFile."waybar/style.css".source = ./waybar/style.css;
}
