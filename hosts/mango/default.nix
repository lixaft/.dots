{
  pkgs,
  config,
  ...
}: {
  imports = [
    ../../modules/boot.nix
    ../../modules/locale.nix
    ../../modules/nix.nix
    ./hardware.nix
  ];

  fileSystems = {
    "/media" = {
      device = "papaya:/volume1/Jellyfin";
      fsType = "nfs";
    };
  };

  environment.systemPackages = with pkgs; [nfs-utils];

  system.stateVersion = "24.11";
}
