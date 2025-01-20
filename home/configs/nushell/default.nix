{
  lib,
  config,
  ...
}: {
  programs.nushell = {
    enable = true;

    extraConfig =
      # nu
      ''
        $env.config.show_banner = false
        $env.config.table.mode = "psql"

        $env.config.keybindings = [
          {
            name: tmux_sessionizer
            modifier: CONTROL
            keycode: Char_s
            mode: emacs
            event: {
              send: executehostcommand,
              cmd: "${../../scripts/tmux-sessionizer}"
            }
          }
          {
            name: tmux_sessionizer_home
            modifier: CONTROL
            keycode: Char_h
            mode: emacs
            event: {
              send: executehostcommand,
              cmd: "${../../scripts/tmux-sessionizer} ${config.home.homeDirectory}"
            }
          }
          {
            name: tmux_sessionizer_tmp
            modifier: CONTROL
            keycode: Char_t
            mode: emacs
            event: {
              send: executehostcommand,
              cmd: "${../../scripts/tmux-sessionizer} /tmp"
            }
          }
          {
            name: tmux_sessionizer_todo
            modifier: CONTROL
            keycode: Char_g
            mode: emacs
            event: {
              send: executehostcommand,
              cmd: "${../../scripts/tmux-sessionizer} ${config.home.homeDirectory}/todo.md"
            }
          }
        ]

        source ${config.xdg.cacheHome}/zoxide/init.nu

        def --env __smart_cd [path?: string] {
          if ($path == null and $env.TMUX? != null) {
            let session_path = tmux display-message -p "#{session_path}"
            z $session_path
          } else if ($path != null) {
            z $path
          } else {
            z
          }
        }
      '';

    shellAliases = {
      "l" = "ls";
      "la" = "ls -a";
      "lla" = "ls -la";

      "cd" = "__smart_cd";
      "ci" = "zi";
      "cat" = "bat";
      "diff" = "batdiff";
      "man" = "batman";
    };

    # I don't really know why, but they don't seem to be picked up automatically.
    environmentVariables = config.home.sessionVariables;
    extraEnv =
      # nu
      ''
        use std/util "path add"
        ${lib.concatStringsSep "\n" (
          map (x: ''path add "${x}"'') config.home.sessionPath
        )}
      '';
  };
}
