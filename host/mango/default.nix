{
  pkgs,
  config,
  flakeConfig,
  ...
}: {
  imports = [
    ../../module/boot.nix
    ../../module/locale.nix
    ../../module/nix.nix
    ./hardware.nix
  ];

  fileSystems = {
    "/jellyfin" = {
      device = "papaya:/volume1/Jellyfin";
      fsType = "nfs";
    };
  };

  hardware = {
    bluetooth.enable = false;
  };

  networking = {
    hostName = flakeConfig.host;
    networkmanager.enable = true;
    networkmanager.wifi.powersave = false;
    firewall.enable = true;
  };

  users.users = {
    ${flakeConfig.user} = {
      extraGroups = ["networkmanager"];
    };
    ${config.services.jellyfin.user} = {
      shell = pkgs.bash;
      extraGroups = ["users"];
    };
  };

  environment.systemPackages = with pkgs; [
    nfs-utils
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services = {
    jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
    };
  };

  system.stateVersion = "24.11";
}
