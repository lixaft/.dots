{
  flakeConfig,
  flakeLib,
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
      l = "ls";
      la = "ls -a";
      lla = "ls -la";

      cdi = "zi";

      code = "${pkgs.vscodium}/bin/codium";

      # Fix a weird copy/past bug in wsl.
      # I don't think this is needed anymore, just keeping around ATM.
      fixway = "ln -s /mnt/wslg/runtime-dir/wayland-0* /run/user/1000/";
    };

    packages = with pkgs; [
      alacritty
      binutils
      brave
      curl
      discord
      eza
      fd
      ffmpeg
      figma-linux
      filebot
      gh
      gimp3-with-plugins
      gnome-text-editor
      google-chrome
      jq
      less
      nautilus
      nerd-fonts.dejavu-sans-mono
      obs-studio
      pavucontrol
      peek
      pkgs.file
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
    bash.enable = true;
    carapace.enable = true;
    home-manager.enable = true;
    nix-index.enable = true;
    thefuck.enable = true;
    zoxide.enable = true;
  };

  fonts.fontconfig.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };
  };

  imports = [
    ./config/alacritty
    ./config/bash
    ./config/bat
    ./config/direnv
    ./config/fish
    ./config/fzf
    ./config/gdb
    ./config/git
    ./config/hypr
    ./config/lf
    ./config/litecli
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
