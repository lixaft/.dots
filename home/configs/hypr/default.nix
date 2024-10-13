{ lib, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = lib.readFile ./hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "${../../../wall.png}";
      wallpaper = ", ${../../../wall.png}";
    };
  };
}
