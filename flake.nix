{
  description = "Home, sweet home";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tokyonight = {
      url = "github:folke/tokyonight.nvim";
      flake = false;
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    mkSystem = (import ./lib inputs).mkSystem;
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;

    nixosConfigurations = {
      "kiwi" = mkSystem {
        system = "x86_64-linux";
        host = "kiwi";
        user = "lixaft";
        home = {
          enable = true;
          stateVersion = "23.11";
        };
      };
      "lemon" = mkSystem {
        system = "x86_64-linux";
        host = "lemon";
        user = "lixaft";
        home = {
          enable = true;
          stateVersion = "23.11";
        };
      };
      "powder" = mkSystem {
        system = "x86_64-linux";
        host = "powder";
        user = "lixaft";
        wsl.enable = true;
        home = {
          enable = true;
          stateVersion = "23.11";
        };
      };
    };
  };
}
