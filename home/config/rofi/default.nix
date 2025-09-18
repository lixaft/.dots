{...} @ inputs: {
  xdg.configFile = {
    "rofi/launcher.rasi".text = import ./launcher.nix inputs;
  };

  programs.rofi = {
    enable = true;

    extraConfig = {
      modi = "drun";
      show-icons = true;
    };
  };
}
