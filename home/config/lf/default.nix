{
  flakeLib,
  lib,
  pkgs,
  ...
}: let
  c = flakeLib.colors;

  toFmt = color: let
    rgb = flakeLib.parseHexColor color;
    str = builtins.toString;
  in "\\033[38;2;${str rgb.r};${str rgb.g};${str rgb.b}m";

  toFmtB = color: let
    rgb = flakeLib.parseHexColor color;
    str = builtins.toString;
  in "\\033[1;38;2;${str rgb.r};${str rgb.g};${str rgb.b}m";
in {
  xdg = {
    desktopEntries."lf" = {
      name = "Lf";
      genericName = "File Manager";
      exec = "${lib.getExe pkgs.alacritty} --command lf";
      categories = [];
    };

    configFile = {
      "lf/icons".source = ./icons;
    };
  };

  programs.lf = {
    enable = true;

    settings = {
      number = true;
      relativenumber = true;
      drawbox = true;
      hidden = true;
      icons = true;

      borderfmt = toFmt c.ui.separator;
      numberfmt = toFmt c.ui.separator;
      promptfmt = "${toFmtB c.lavender}%d${toFmtB c.fg}%f\\033[0m";
    };

    keybindings = {
      "Y" = "&echo $fx | wl-copy";
    };

    previewer.source = lib.getExe pkgs.pistol;
  };
}
