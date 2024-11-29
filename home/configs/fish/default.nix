{
  config,
  inputs,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      refresh = "source ${config.xdg.configHome}/fish/config.fish";
    };

    shellAbbrs = {
      "-" = {
        position = "command";
        expansion = "cd -";
      };
      "!!" = {
        position = "anywhere";
        function = "__last_command";
      };
      "uniqc" = {
        position = "command";
        expansion = "sort | uniq -c | sort -nr";
      };
    };

    functions = {
      __editor_paginate =
        # fish
        ''fish_commandline_append " &| $EDITOR -"'';

      __last_command =
        # fish
        ''echo $history[1]'';

      fish_prompt =
        # fish
        ''
          set -l last_status $status

          # Path.
          set_color --bold blue
          printf "$(prompt_pwd)"

          # Git.
          set_color normal
          printf "$(fish_git_prompt)"

          # Status.
          if test $last_status -ne 0
              set_color --bold red
            printf " [$last_status]"
          end

          # Symbol.
          set_color normal --bold
          printf ' ➜ '

          # Reset.
          set_color normal
        '';
    };

    interactiveShellInit =
      # fish
      ''
        set fish_greeting ""
        set -g __fish_git_prompt_color_branch magenta --bold

        # Nix override the default Ctrl+r with a `fzf` one :s
        bind --erase \cr

        # Bindings.
        bind \ev "__editor_paginate";
        bind \cs "${../../scripts/tmux-sessionizer}; commandline -f execute"
        bind \ch "${../../scripts/tmux-sessionizer} ~; commandline -f execute"
        bind \ct "${../../scripts/tmux-sessionizer} /tmp; commandline -f execute"
        bind \cg "${../../scripts/tmux-sessionizer} ~/todo.md; commandline -f execute"

        # Load direnv.
        eval (direnv hook fish)

        # Theme.
        ${lib.readFile "${inputs.tokyonight}/extras/fish/tokyonight_night.fish"}
      '';

    shellInitLast =
      # fish
      ''
        #
        # Make `cd` go the the tmux session if any. This cannot be defined
        # with the `functions' option from home manager, as it must be define
        # after zoxide initialization.
        function cd
          if set -q "TMUX"; and test -z "$argv"
              set argv (tmux display-message -p "#{session_path}")
          end
          __zoxide_z $argv
        end
      '';
  };
}
