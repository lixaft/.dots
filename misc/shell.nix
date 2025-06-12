{pkgs, ...}:
pkgs.mkShell {
  packages = with pkgs; [
    home-manager
    just
    python3
  ];
}
