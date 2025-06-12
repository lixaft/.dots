{
  flakeLib,
  lib,
  pkgs,
  ...
}: let
  c = flakeLib.colors;
in {
  programs.alacritty = {
    enable = true;

    settings = {
      font = {
        normal.family = "DejaVuSansM Nerd Font";
        size = 20;
      };

      colors = {
        primary = {
          background = c.bg;
          foreground = c.fg;
        };
        normal = c.term;
        bright = c.term;
      };

      terminal.shell = {
        program = "bash";
        args = [
          "-c"
          "${lib.getExe pkgs.tmux} attach &>/dev/null || ${../../bin/tmux-sessionizer} ~"
        ];
      };
    };
  };
}
