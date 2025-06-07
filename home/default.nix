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
      LS_COLORS = flakeLib.concatAttrs "=" ":" {
        di = "00;36";
        ex = "01;32";
        ln = "01;37";
        or = "01;31";
        "*.bak" = "00;90";
        "*.lock" = "00;90";
        "*~" = "00;90";
      };
    };

    shellAliases = {
      cdi = "zi";
      code = lib.getExe pkgs.vscodium;

      # Fix a weird clipboard bug in wsl.
      # TODO: I don't think this is needed anymore, just keeping around ATM.
      fixway = "ln -s /mnt/wslg/runtime-dir/wayland-0* /run/user/1000/";
    };

    packages = import ./packages.nix pkgs;
  };

  programs = {
    carapace.enable = true;
    home-manager.enable = true;
    nix-index.enable = true;
    pay-respects.enable = true;
    zoxide.enable = true;
  };

  imports = [
    ./config
  ];
}
