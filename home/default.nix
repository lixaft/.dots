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
      code = lib.getExe pkgs.vscodium;

      # Fix a weird clipboard bug in wsl.
      # TODO: I don't think this is needed anymore, just keeping around ATM.
      fixway = "ln -s /mnt/wslg/runtime-dir/wayland-0* /run/user/1000/";
    };

    packages = import ./packages.nix pkgs;

    pointerCursor = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 32;
      gtk.enable = true;
    };
  };

  programs = {
    nix-index.enable = true;
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["DejaVuSansM Nerd Font"];
    };
  };

  imports = [
    ./config
  ];
}
