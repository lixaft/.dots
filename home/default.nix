{
  systemConfig,
  pkgs,
  ...
}: {
  home = rec {
    stateVersion = systemConfig.home.stateVersion;

    username = systemConfig.user;
    homeDirectory = "/home/${username}";
    sessionPath = [
      "${./scripts}"
      "${homeDirectory}/.local/bin"
    ];

    shellAliases = {
      db = "distrobox";
      dev = "distrobox enter dev";

      df = "df -H";
      du = "du -H";

      fd = "${pkgs.fd}/bin/fd --hidden";
      grep = "${pkgs.ripgrep}/bin/rg";
    };

    packages = with pkgs; [
      act
      alacritty
      baobab
      bazecor
      bc
      black
      blender
      brave
      btop
      cargo
      cloc
      cmake
      curl
      discord
      distrobox
      eog
      fd
      feh
      ffmpeg
      figma-linux
      filebot
      flameshot
      gcc
      geeqie
      gh
      gimp
      gnumake
      go
      google-chrome
      gpick
      graphviz
      hyprpicker
      iaito
      jq
      just
      killall
      less
      luajit
      mypy
      nautilus
      nerdfonts
      nixfmt-rfc-style
      nodePackages.prettier
      nodejs
      obs-studio
      parallel
      pavucontrol
      peek
      pkgs.file
      playerctl
      pre-commit
      protonvpn-gui
      pypy
      python3
      qbittorrent
      rename
      ripgrep
      ruff
      selene
      spotify
      sqlfluff
      stylua
      sushi
      tlrc
      totem
      tree
      twine
      typos
      uv
      vcv-rack
      wget
      wl-clipboard
      xclip
      xdg-utils
      zig
    ];
  };

  programs = {
    bash.enable = true;
    home-manager.enable = true;
    thefuck.enable = true;
    zoxide.enable = true;
  };

  services = {
    picom.enable = true;
    unclutter.enable = true;
  };

  fonts.fontconfig.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
    };
  };

  imports = [
    ./configs/alacritty
    ./configs/bat
    ./configs/eza
    ./configs/fish
    ./configs/fzf
    ./configs/git
    ./configs/hypr
    ./configs/i3
    ./configs/lf
    ./configs/litecli
    ./configs/nixpkgs
    ./configs/nvim
    ./configs/rofi
    ./configs/theme
    ./configs/tmux
    ./configs/xdg
  ];

  systemd.user.startServices = "sd-switch";
}
