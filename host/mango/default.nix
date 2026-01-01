{
  pkgs,
  flakeConfig,
  ...
}: {
  imports = [
    ../shared/boot.nix
    ../shared/locale.nix
    ../shared/network.nix
    ../shared/nix.nix
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [
    nfs-utils
  ];

  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";
      };
    };
  };

  fileSystems = {
    "/starr/media" = {
      device = "papaya:/volume1/media";
      fsType = "nfs";
    };
  };

  systemd.tmpfiles.rules = [
    "d /starr/media 775 root users -"
  ];

  networking = {
    hostName = flakeConfig.host;
    firewall.enable = true;
  };

  nixarr = {
    enable = true;
    mediaDir = "/starr/media";
    stateDir = "/starr/.state";

    jellyfin = {
      enable = true;
      openFirewall = true;
    };
    jellyseerr = {
      enable = true;
      openFirewall = true;
    };
    prowlarr = {
      enable = true;
      openFirewall = true;
    };
    radarr = {
      enable = true;
      openFirewall = true;
    };
    sonarr = {
      enable = true;
      openFirewall = true;
    };
    transmission = {
      enable = true;
      openFirewall = true;
      flood.enable = true;
    };
  };

  services = {
    flaresolverr = {
      enable = true;
      openFirewall = true;
    };
  };

  system.stateVersion = "24.11";
}
