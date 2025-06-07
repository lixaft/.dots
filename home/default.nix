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
      # I don't think this is needed anymore, just keeping around ATM.
      fixway = "ln -s /mnt/wslg/runtime-dir/wayland-0* /run/user/1000/";
    };

    packages = with pkgs; [
      alacritty
      binutils
      brave
      discord
      eza
      fd
      ffmpeg
      filebot
      gh
      gimp3-with-plugins
      google-chrome
      less
      nautilus
      nerd-fonts.dejavu-sans-mono
      pavucontrol
      peek
      pkgs.file
      protonvpn-gui
      qbittorrent
      qimgv
      rename
      ripgrep
      spotify
      tlrc
      vlc
      vscodium
      wl-clipboard
      xdg-utils
    ];
  };

  programs = {
    carapace.enable = true;
    home-manager.enable = true;
    nix-index.enable = true;
    pay-respects.enable = true;
    zoxide.enable = true;
  };

  imports = [
    ./config/alacritty
    ./config/bash
    ./config/bat
    ./config/dconf
    ./config/direnv
    ./config/fzf
    ./config/gdb
    ./config/git
    ./config/hypr
    ./config/lf
    ./config/nushell
    ./config/nvim
    ./config/pistol
    ./config/rofi
    ./config/starship
    ./config/theme
    ./config/tmux
    ./config/xdg
  ];

  systemd.user.startServices = "sd-switch";
}
