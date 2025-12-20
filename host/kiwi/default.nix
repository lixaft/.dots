{
  config,
  flakeConfig,
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
    wslConf = {
      automount.root = "/mnt";
      network.hostname = flakeConfig.host;
    };
  };

  programs = {
    dconf.enable = true;
    nix-index-database.comma.enable = true;
  };

  # virtualisation = {
  #   containers.enable = true;
  #   docker = {
  #     enable = true;
  #   };
  # };

  fileSystems = {
    "/c" = {
      device = "C:";
      fsType = "drvfs";
    };
  };

  users.users.${flakeConfig.user}.extraGroups = [
    "docker"
  ];

  system.stateVersion = "23.11";
}
