{
  config,
  lib,
  pkgs,
  ...
}: {
  home.shellAliases = {
    code = lib.getExe config.programs.vscode.package;
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
  };
}
