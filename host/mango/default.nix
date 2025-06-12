{
  pkgs,
  config,
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
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
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

    jellyfin = {
      enable = true;
      openFirewall = true;
    };
  };

  fileSystems = {
    "/jellyfin" = {
      device = "papaya:/volume1/Jellyfin";
      fsType = "nfs";
    };
  };

  networking = {
    hostName = flakeConfig.host;
    firewall.enable = true;
  };

  users.users = {
    ${config.services.jellyfin.user} = {
      shell = pkgs.bash;
      extraGroups = ["users"];
    };
  };

  system.stateVersion = "24.11";
}
