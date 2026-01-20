{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    zoxide
    ghq
    xh
    gh
    fzf
    fd
    ripgrep
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
