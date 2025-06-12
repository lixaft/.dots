{pkgs ? import <nixpkgs> {}}: let
  py = "3";
  venv = ".venv";

  pyPkg = pkgs."python${py}";
  pyPkgs = pkgs."python${py}Packages";
in
  pkgs.mkShell {
    packages =
      (with pkgs; [
        uv
        pyPkg
      ])
      ++ (with pyPkgs; [
        typing-extensions
      ]);

    shellHook = ''
      if [[ ! -d ${venv} ]]; then
          uv venv \
            --quiet \
            --python ${pyPkg}/bin/python \
            ${venv}
          uv pip install \
            --quiet \
            --python ${venv}/bin/python \
            --requirement \
            nix/requirements.txt
      fi
      source ${venv}/bin/activate

      if [[ -f .env ]]; then
          export $(grep -v '^#' .env | xargs)
      fi
    '';
  }
