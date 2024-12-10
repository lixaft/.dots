{systemConfig, ...}: {
  imports = [
    ../../modules/locale.nix
    ../../modules/nix.nix
    ../../modules/user.nix
    ../../modules/virtualisation.nix
  ];

  wsl = {
    enable = true;
    startMenuLaunchers = true;
    defaultUser = systemConfig.user;
    wslConf = {
      automount.root = "/mnt";
      network.hostname = systemConfig.host;
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
