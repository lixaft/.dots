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
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  in {
    devShells = lib.genAttrs systems (system: {
      default = import ./nix/shell.nix {pkgs = nixpkgs.legacyPackages.${system};};
    });
  };
}
