{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
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

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixarr = {
      url = "github:rasmus-kirk/nixarr";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, ...} @ inputs: let
    inherit (nixpkgs) lib;
    mkSystem = (import ./lib inputs).mkSystem;

    allSystemsPkgs = fn:
      lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ] (system: fn nixpkgs.legacyPackages.${system});
  in {
    formatter = allSystemsPkgs (pkgs: pkgs.alejandra);

    devShells = allSystemsPkgs (pkgs: {
      default = import ./misc/shell.nix {inherit pkgs;};
    });

    templates = import ./misc/template {};

    nixosConfigurations = {
      "kiwi" = mkSystem {
        system = "x86_64-linux";
        host = "kiwi";
        user = "lixaft";
        wsl.enable = true;
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
