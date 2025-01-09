{
  description = "Generic template";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
  };

  outputs = {nixpkgs, ...}: let
    inherit (nixpkgs) lib;

    systems = [
      "x86_64-linux"
      "aarch64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
    ];
  in {
    devShells = lib.genAttrs systems (system: {
      default = import ./nix/shell.nix {pkgs = nixpkgs.legacyPackages.${system};};
    });
  };
}
