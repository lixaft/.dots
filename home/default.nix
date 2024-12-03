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

    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };

    shellAliases = rec {
      df = "df -H";
      du = "du -H";

      fd = "${pkgs.fd}/bin/fd --hidden";
      grep = "${pkgs.ripgrep}/bin/rg";

      eza = "${pkgs.eza}/bin/eza --git --icons --group-directories-first";
      ls = "${eza}";
      l = "${eza}";
      la = "${eza} --all";
      ll = "${eza} --long";
      lla = "${eza} --long --all";
      tree = "${eza} --tree";
      t = "${eza} --tree";
      ta = "${eza} --tree --all";
      tl = "${eza} --tree --long";
      tla = "${eza} --tree --long --all";

      docker-compose = "${pkgs.podman-compose}/bin/podman-compose";
    };

    packages = with pkgs; [
      alacritty
      binutils
      brave
      cloc
      curl
      discord
      eza
      fd
      ffmpeg
      figma-linux
      filebot
      gh
      gimp
      google-chrome
      iaito
      jq
      killall
      less
      nerdfonts
      obs-studio
      parallel
      pavucontrol
      pcmanfm
      peek
      pkgs.file
      playerctl
      qbittorrent
      qimgv
      rename
      ripgrep
      spotify
      tlrc
      vlc
      wl-clipboard
      xdg-utils
    ];
  };

  programs = {
    bash.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    home-manager.enable = true;
    nix-index.enable = true;
    thefuck.enable = true;
    zoxide.enable = true;
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
    ./configs/fish
    ./configs/fzf
    ./configs/git
    ./configs/hypr
    ./configs/lf
    ./configs/litecli
    ./configs/nixpkgs
    ./configs/nvim
    ./configs/pistol
    ./configs/rofi
    ./configs/theme
    ./configs/tmux
    ./configs/xdg
  ];

  systemd.user.startServices = "sd-switch";
}
