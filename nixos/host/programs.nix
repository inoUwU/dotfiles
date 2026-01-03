{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # System Tools
    vim 
    wget
    gh
    wirelesstools
    iw
    iwd
    
    # Languages (from apps/lang.nix)
    go
    bun 
    nodejs_24
    nixfmt-rfc-style
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];
}
