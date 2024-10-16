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

    shellAliases = rec {
      dev = "distrobox enter dev";

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
      t = "${eza} --tree";
      ta = "${eza} --tree --all";
      tl = "${eza} --tree --long";
      tla = "${eza} --tree --long --all";
    };

    packages = with pkgs; [
      act
      alacritty
      bazecor
      bc
      blender
      brave
      btop
      cargo
      cloc
      cmake
      curl
      discord
      distrobox
      eza
      fd
      ffmpeg
      figma-linux
      filebot
      gcc
      geeqie
      gh
      gimp
      gnumake
      go
      google-chrome
      graphviz
      grim
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
      nodejs
      obs-studio
      parallel
      pavucontrol
      peek
      pkgs.file
      playerctl
      pre-commit
      protonvpn-gui
      python3
      qbittorrent
      qimgv # Image viewer.
      rename
      ripgrep
      slurp
      spotify
      sushi # File previewer.
      tlrc
      totem # Movie player.
      tree
      twine
      uv
      vcv-rack
      vlc
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
    ./configs/rofi
    ./configs/theme
    ./configs/tmux
    ./configs/xdg
  ];

  systemd.user.startServices = "sd-switch";
}
