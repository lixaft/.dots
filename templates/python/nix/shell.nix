{pkgs ? import <nixpkgs> {}}: let
  py = "3";
  venv = ".venv";

  py-pkg = pkgs."python${py}";
  py-pkgs = pkgs."python${py}Packages";
in
  pkgs.mkShell {
    packages =
      (with pkgs; [
        uv
        pypkg
      ])
      ++ (with py-pkgs; [
        six
      ]);

    shellHook = ''
      if [[ ! -d ${venv} ]]; then
          uv venv --quiet --python ${py-pkg}/bin/python ${venv}
          uv pip install --quiet --python${venv}/bin/python --requirement nix/requirements.txt
      fi
      source ${venv}/bin/activate

      if [[ -f .env ]]; then
          export $(cat .env | xargs)
      fi
    '';
  }
