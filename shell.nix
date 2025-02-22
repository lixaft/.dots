{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    home-manager
    just
    nixos-anywhere
  ];
}
