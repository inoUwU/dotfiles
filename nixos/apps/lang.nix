{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    go
    bun 
    nodejs_24
    nixfmt-rfc-style
  ];
}
