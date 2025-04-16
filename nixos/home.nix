# ~/.config/nixpkgs/home.nix
{ config, pkgs, ... }:

{
  # user name 
  home.username = "ino";
  # ユーザーのホームディレクトリを指定
  home.homeDirectory = "/home/ino";
  # Home Manger version
  home.stateVersion = "24.11";

  programs.fastfetch.enable = true;
  programs.zsh.enable = true;
  programs.go.enable = true;
  programs.starship = {
   enable = true;
   # Configuration written to ~/.config/starship.toml
   settings = {
   };
  };

  programs.tmuxPlugins.cpu.enable = true;
  programs.tmux = {
    enable = true;
    extraConfig = ''
      ...
      set -g status-right '#[fg=black,bg=color15] #{cpu_percentage}  %H:%M '
      run-shell ${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/cpu.tmux
    '';
  };
}

