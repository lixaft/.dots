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
    ./hardware.nix
  ];

  fileSystems = {
    "/media" = {
      device = "papaya:/volume1/Jellyfin";
      fsType = "nfs";
    };
  };

  networking = {
    hostName = flakeConfig.host;
    networkmanager.enable = true;
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
    git
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
