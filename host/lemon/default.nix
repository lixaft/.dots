{
  pkgs,
  config,
  flakeConfig,
  ...
}: {
  imports = [
    ../shared/audio.nix
    ../shared/bluetooth.nix
    ../shared/boot.nix
    ../shared/desktop.nix
    ../shared/locale.nix
    ../shared/network.nix
    ../shared/nix.nix
    ../shared/virtualisation.nix
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  hardware = {
    nvidia = {
      open = false;
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  networking = {
    hostName = flakeConfig.host;
    firewall.enable = true;
  };

  programs = {
    nix-index-database.comma.enable = true;
  };

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = ["nvidia"];
    };
  };

  fileSystems = {
    "/jellyfin" = {
      device = "papaya:/volume1/Jellyfin";
      fsType = "nfs";
    };
  };

  users.users.${flakeConfig.user}.extraGroups = [
    "dialout"
  ];

  system.stateVersion = "23.11";
}
