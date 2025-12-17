{
  pkgs,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
    };

    initExtra = ''
      # ここに普通の .zshrc を書ける
      export EDITOR=nvim
    '';
  };
}
