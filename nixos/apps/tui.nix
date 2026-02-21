{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    ghq
    xh
    fd
    ripgrep
    microfetch
    lazydocker
    bluetuith
  ];

  # programs.X.enable installs the package and wires up shell integrations /
  # config management automatically, so these no longer need to be in
  # home.packages.
  programs.bottom.enable = true;
  programs.numbat.enable = true;

  # zoxide: shell integration (eval "$(zoxide init zsh)") is set up automatically
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  # fzf: key-bindings and completion scripts are sourced automatically
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # gh: shell completion is registered automatically
  programs.gh.enable = true;

  # lazygit: declarative config management via programs.lazygit.settings
  programs.lazygit.enable = true;

  # rofi: declarative config management via programs.rofi.extraConfig / theme
  programs.rofi.enable = true;
}
