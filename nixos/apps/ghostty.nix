{
  pkgs,
  lib,
  ...
}: {
  # programs.ghostty.enable installs ghostty and handles shell integration;
  # the explicit home.packages entry is no longer needed.
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
  };
}
