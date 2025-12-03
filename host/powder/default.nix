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

  virtualisation = {
    containers.enable = true;
    docker = {
      enable = true;
    };
  };

  fileSystems = let
    stim_mount = name: {
      device = "//fileshare.stimstudio.local/${name}$";
      fsType = "cifs";
      options = ["credentials=/root/.cifs" "x-systemd.automount" "noauto" "uid=1000"];
    };
  in {
    "/c" = {
      device = "C:";
      fsType = "drvfs";
    };
    "/y" = stim_mount "stim-projects$";
    "/n" = stim_mount "share$";
    "/o" = stim_mount "plugins$";
  };

  users.users.${flakeConfig.user}.extraGroups = [
    "docker"
  ];

  system.stateVersion = "23.11";
}
