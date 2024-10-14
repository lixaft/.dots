{
  systemConfig,
  pkgs,
  ...
}: {
  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  networking = {
    hostName = systemConfig.host;
    networkmanager.enable = true;
    firewall.enable = true;
  };

  services = {
    displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
      };
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
          i3blocks
        ];
      };
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
    };

    blueman.enable = true;
  };

  programs = {
    hyprland.enable = true;
  };

  xdg.portal = {
    enable = true;
    config.common.default = "*";
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
  };

  users.users.${systemConfig.user}.extraGroups = ["networkmanager"];
}
