{
  flakeConfig,
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
    hostName = flakeConfig.host;
    networkmanager.enable = true;
    firewall.enable = true;
  };

  services = {
    displayManager = {
      defaultSession = "hyprland";
    };

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --remember-user-session --time";
          user = flakeConfig.user;
        };
      };
    };

    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
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

  users.users.${flakeConfig.user}.extraGroups = ["networkmanager"];
}
