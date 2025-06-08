{
  flakeConfig,
  pkgs,
  ...
}: {
  imports = [
    ../shared/locale.nix
    ../shared/nix.nix
  ];

  wsl = {
    enable = true;
    startMenuLaunchers = true;
    defaultUser = flakeConfig.user;
    docker-desktop.enable = true;
    wslConf = {
      automount.root = "/mnt";
      network.hostname = flakeConfig.host;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
  ];

  programs = {
    dconf.enable = true;
    nix-index-database.comma.enable = true;
  };

  fileSystems = {
    "/c" = {
      device = "C:";
      fsType = "drvfs";
    };
    "/n" = {
      device = "N:";
      fsType = "drvfs";
    };
    "/o" = {
      device = "O:";
      fsType = "drvfs";
    };
    "/y" = {
      device = "Y:";
      fsType = "drvfs";
    };
  };

  system.stateVersion = "23.11";
}
