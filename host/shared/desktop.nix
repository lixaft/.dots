{
  lib,
  flakeConfig,
  pkgs,
  ...
}: {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  programs = {
    hyprland.enable = true;
  };

  services = {
    displayManager = {
      defaultSession = "hyprland";
    };
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${lib.getExe pkgs.tuigreet} --remember --remember-user-session --time";
          user = flakeConfig.user;
        };
      };
    };
  };
}
