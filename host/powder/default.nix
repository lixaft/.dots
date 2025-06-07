{flakeConfig, ...}: {
  imports = [
    ../shared/locale.nix
    ../shared/nix.nix
    ../shared/shell.nix
    ../shared/user.nix
    ../shared/virtualisation.nix
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
