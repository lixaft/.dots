{
  lib,
  flakeLib,
  config,
  ...
}: let
  c = flakeLib.colors;
in {
  programs.nushell = {
    enable = true;

    extraConfig =
      # nu
      ''
        $env.config.show_banner = false
        $env.config.table.mode = "light"

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

        $env.config.color_config = {
          header: { fg: "${c.lavender}", attr: b },
          row_index: { fg: "${c.ui.dim}" },
          separator: { fg: "${c.ui.dim}" },

          shape_block: { fg: "${c.syntax.comment}" },
          shape_bool: { fg: "${c.syntax.boolean}" },
          shape_custom: { fg: "${c.red}" },
          shape_external: { fg: "${c.fg}" },
          shape_externalarg: { fg: "${c.gray}" },
          shape_flag: { fg: "${c.gray}" },
          shape_float: { fg: "${c.syntax.number}" },
          shape_garabage: { fg: "${c.fg}", bg: "${c.red}" },
          shape_globpattern: { fg: "${c.syntax.string}" },
          shape_int: { fg: "${c.syntax.number}" },
          shape_internalcall: { fg: "${c.syntax.keyword}", attr: b },
          shape_list: { fg: "${c.syntax.comment}" },
          shape_literal: { fg: "${c.red}" },
          shape_nothing: { fg: "${c.fg}" },
          shape_operator: { fg: "${c.syntax.operator}" },
          shape_path: { fg: "${c.syntax.string}" },
          shape_record: { fg: "${c.red}" },
          shape_signature: { fg: "${c.syntax.comment}" },
          shape_string: { fg: "${c.syntax.string}" },
          shape_string_interpolation: { fg: "${c.syntax.comment}" },
          shape_table: { fg: "${c.syntax.comment}" },
          shape_variable: { fg: "${c.fg}" },
        }

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
      cd = "__smart_cd";
      fg = "job unfreeze";
    };

    # I don't really know why, but they don't seem to be added automatically.
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
