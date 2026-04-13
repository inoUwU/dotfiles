{lib, ...}: {
  imports = [
    ./web.nix
    ./ghostty.nix
    ./direnv.nix
    ./tui.nix
    ./zsh.nix
    ./tmux.nix
    ./starship.nix
    ./editors.nix
    ./media.nix
    ./terminals.nix
  ];
}
