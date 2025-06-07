{
  pkgs,
  config,
  flakeConfig,
  ...
}: {
  imports = [
    ../shared/boot.nix
    ../shared/desktop.nix
    ../shared/locale.nix
    ../shared/nix.nix
    ../shared/shell.nix
    ../shared/user.nix
    ../shared/virtualisation.nix
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
    "/jellyfin" = {
      device = "papaya:/volume1/Jellyfin";
      fsType = "nfs";
    };
  };

  environment.systemPackages = with pkgs; [nfs-utils];

  nix.settings.trusted-users = [flakeConfig.user];

  system.stateVersion = "23.11";
}
