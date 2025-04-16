{
  flakeConfig,
  pkgs,
  ...
}: {
  home = rec {
    stateVersion = flakeConfig.home.stateVersion;

    username = flakeConfig.user;
    homeDirectory = "/home/${username}";

    sessionPath = [
      "${./scripts}"
      "${homeDirectory}/.local/bin"
    ];

    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };

    shellAliases = {
      l = "ls";
      la = "ls -a";
      lla = "ls -la";

      cdi = "zi";

      # Fix a weird copy/past bug on wsl.
      fixway = "ln -s /mnt/wslg/runtime-dir/wayland-0* /run/user/1000/";

      code = "${pkgs.vscodium}/bin/codium";
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
      gimp
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
    direnv.enable = true;
    direnv.nix-direnv.enable = true;
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
    ./configs/alacritty
    ./configs/bat
    ./configs/fish
    ./configs/fzf
    ./configs/gdb
    ./configs/git
    ./configs/hypr
    ./configs/lf
    ./configs/litecli
    ./configs/nushell
    ./configs/nvim
    ./configs/pistol
    ./configs/rofi
    ./configs/starship
    ./configs/theme
    ./configs/tmux
    ./configs/xdg
  ];

  systemd.user.startServices = "sd-switch";
}
