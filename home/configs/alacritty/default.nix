{inputs, ...}: {
  programs.alacritty = {
    enable = true;

    settings = {
      general = {
        import = ["${inputs.tokyonight}/extras/alacritty/tokyonight_night.toml"];
      };

      font = {
        normal.family = "DejaVuSansM Nerd Font";
        size = 20;
      };

      colors = {
        primary.background = "#000000";
      };

      terminal.shell = {
        program = "fish";
        args = [
          "--interactive" # Required for tmux colors.
          "--command"
          "tmux attach || ${../../scripts/tmux-sessionizer} ~"
        ];
      };
    };
  };
}
