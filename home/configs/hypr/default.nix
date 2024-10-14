{lib, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = lib.readFile ./hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;
    settings = let
      img = "${../../../wall.png}";
    in {
      preload = img;
      wallpaper = ",${img}";
    };
  };
}
