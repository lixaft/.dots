{
  pkgs,
  config,
  flakeConfig,
  ...
}: {
  imports = [
    ../../module/boot.nix
    ../../module/desktop.nix
    ../../module/locale.nix
    ../../module/nix.nix
    ../../module/shell.nix
    ../../module/user.nix
    ../../module/virtualisation.nix
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
