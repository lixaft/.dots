{pkgs, ...}:
pkgs.mkShell {
  packages = with pkgs; [
    agenix-cli
    home-manager
    just
    python3
  ];
}
