{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [];

  shellHook = ''
    if [[ -f .env ]]; then
        export $(cat .env | xargs)
    fi
  '';
}
