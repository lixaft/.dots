{system, ...}: {
  imports = [
    ../../modules/local.nix
    ../../modules/nix.nix
    ../../modules/user.nix
    ../../modules/virtualisation.nix
  ];

  wsl = {
    enable = true;
    startMenuLaunchers = true;
    defaultUser = system.user;
    wslConf = {
      automount.root = "/mnt";
      network.hostname = system.host;
    };
  };

  fileSystems = {
    "/a" = {
      device = "A:";
      fsType = "drvfs";
    };
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
