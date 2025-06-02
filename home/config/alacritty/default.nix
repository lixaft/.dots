{flakeLib, ...}: let
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
        program = "nu";
        args = [
          "--execute"
          "do { tmux attach } or { ${../../bin/tmux-sessionizer} ~ }"
        ];
      };
    };
  };
}
