{
  description = "Home, sweet home";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nix-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    inherit (nixpkgs) lib;
    mkSystem = (import ./lib inputs).mkSystem;

    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  in {
    formatter = lib.genAttrs systems (system: nixpkgs.legacyPackages.${system}.alejandra);

    templates = rec {
      generic = {path = ./misc/template/generic;};
      python = {path = ./misc/template/python;};
      default = generic;
    };

    devShells = lib.genAttrs systems (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.mkShell {
        packages = with pkgs; [
          home-manager
          just
        ];
      };
    });

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
      "mango" = mkSystem {
        system = "x86_64-linux";
        host = "mango";
        user = "lab";
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
