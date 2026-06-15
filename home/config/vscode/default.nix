{
  config,
  lib,
  pkgs,
  ...
}: {
  home.shellAliases = {
    code = lib.getExe config.programs.vscode.package;
  };

  programs.vscodium = {
    enable = true;
    package = pkgs.vscodium;
  };
}
