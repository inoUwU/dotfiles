{ pkgs, ... }:

{
  # programs.alacritty / programs.kitty install the packages and enable
  # declarative config management via programs.*.settings.
  programs.alacritty.enable = true;
  programs.kitty.enable = true;
}
