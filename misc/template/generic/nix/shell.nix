{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [];

  shellHook = ''
    if [[ -f .env ]]; then
        export $(grep -v '^#' .env | xargs)
    fi
  '';
}
