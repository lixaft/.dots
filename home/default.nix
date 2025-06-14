{
  flakeConfig,
  flakeLib,
  lib,
  pkgs,
  ...
}: {
  home = rec {
    stateVersion = flakeConfig.home.stateVersion;

    username = flakeConfig.user;
    homeDirectory = "/home/${username}";

    sessionPath = [
      "${./bin}"
      "${homeDirectory}/.local/bin"
    ];

    sessionVariables = {
      PAGER = "${lib.getExe pkgs.less} --chop-long-lines";
      # Using full exe path does not seem to load plugins...
      EDITOR = "nvim";
      LS_COLORS = flakeLib.concatAttrs "=" ":" {
        di = "00;36";
        ex = "01;32";
        ln = "01;37";
        or = "01;31";
        "*.bak" = "00;90";
        "*.lock" = "00;90";
        "*~" = "00;90";
      };
      NIXPKGS_ALLOW_UNFREE = 1;
    };

    packages = import ./packages.nix pkgs;
  };

  imports = [
    ./config
    ./desktop.nix
    ./xdg.nix
  ];
}
