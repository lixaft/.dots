{pkgs, ...} @ inputs: {
  xdg.configFile = {
    "rofi/launcher.rasi".text = import ./launcher.nix inputs;
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun";
      show-icons = true;
    };
  };
}
