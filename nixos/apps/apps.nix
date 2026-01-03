{lib, ...}: {
  imports = [
    ./web.nix
    ./ghostty.nix
    ./tui.nix
    ./zsh.nix
    ./tmux.nix
    ./starship.nix
    ./editors.nix
    ./media.nix
    ./terminals.nix
  ];
}
