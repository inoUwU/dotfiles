{
  description = "Fract's flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae = {
      url = "github:vicinaehq/vicinae";
    };
  };

  outputs = { self, nixpkgs, home-manager, vicinae, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    homeConfigurations = {
      ino = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # home.nix に inputs を渡すため
        extraSpecialArgs = {
          inherit vicinae;
          inputs = { inherit vicinae; };
        };

        modules = [
          ./home.nix
        ];
      };
    };
  };
}

