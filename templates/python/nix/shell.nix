{pkgs ? import <nixpkgs> {}}: let
  py = "3";
  venv = ".venv";

  pypkg = pkgs."python${py}";
  pypkgs = pkgs."python${py}Packages";
in
  pkgs.mkShell {
    packages =
      (with pkgs; [
        uv
        pypkg
      ])
      ++ (with pypkgs; [
        ]);

    shellHook = ''
      if [[ ! -d ${venv} ]]; then
          uv venv --python ${pypkg}/bin/python ${venv}
          uv pip install --python ${venv}/bin/python --requirement nix/requirements.txt
      fi
      source ${venv}/bin/activate

      if [[ -f .env ]]; then
          export $(cat .env | xargs)
      fi
    '';
  }
