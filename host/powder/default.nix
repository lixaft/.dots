{
  flakeConfig,
  pkgs,
  ...
}: let
  password = builtins.readFile ./password;
in {
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

  fileSystems = {
    "/c" = {
      device = "C:";
      fsType = "drvfs";
    };
    # "/n" = {
    #   device = "N:";
    #   fsType = "drvfs";
    # };
    # "/o" = {
    #   device = "O:";
    #   fsType = "drvfs";
    # };
    # "/y" = {
    #   device = "Y:";
    #   fsType = "drvfs";
    # };
    "/y" = {
      device = "//fileshare.stimstudio.local/stim-projects$";
      fsType = "cifs";
      options = [ "username=ftaxil" "password=${password}" "x-systemd.automount" "noauto" "uid=1000" ];
    };
    "/n" = {
      device = "//fileshare.stimstudio.local/share$";
      fsType = "cifs";
      options = [ "username=ftaxil" "password=${password}" "x-systemd.automount" "noauto" "uid=1000" ];
    };
    "/o" = {
      device = "//fileshare.stimstudio.local/plugins$";
      fsType = "cifs";
      options = [ "username=ftaxil" "password=${password}" "x-systemd.automount" "noauto" "uid=1000" ];
    };
  };

  users.users.${flakeConfig.user}.extraGroups = [
    "docker"
  ];

  system.stateVersion = "23.11";
}
