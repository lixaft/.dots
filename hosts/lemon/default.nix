{
  pkgs,
  config,
  flakeConfig,
  ...
}: {
  imports = [
    ../../modules/boot.nix
    ../../modules/locale.nix
    ../../modules/nix.nix
    ../../modules/user.nix
    ../../modules/desktop.nix
    ../../modules/virtualisation.nix
    ./hardware.nix
  ];

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  fileSystems = {
    "/media" = {
      device = "papaya:/volume1/Jellyfin";
      fsType = "nfs";
    };
  };

  environment.systemPackages = with pkgs; [nfs-utils];

  nix.settings.trusted-users = [flakeConfig.user];

  system.stateVersion = "23.11";
}
