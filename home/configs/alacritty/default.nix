{ inputs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      import = [ "${inputs.tokyonight}/extras/alacritty/tokyonight_night.toml" ];

      font = {
        normal.family = "DejaVuSansM Nerd Font";
        size = 20;
      };

      shell = {
        program = "fish";
        args = [
          "--interactive" # Required for tmux colors.
          "--command"
          "tmux attach || tmux-sessionizer ~"
        ];
      };

      colors.primary.background = "#000000";
    };
  };
}
