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

      colors = rec {
        primary = {
          background = c.bg;
          foreground = c.fg;
        };

        normal = {
          inherit (c.term) black red green yellow blue magenta cyan white;
        };

        bright = normal;
      };

      terminal.shell = {
        program = "nu";
        args = [
          "--interactive" # Required for tmux colors.
          "--command"
          "tmux attach || ${../../scripts/tmux-sessionizer} ~"
        ];
      };
    };
  };
}
