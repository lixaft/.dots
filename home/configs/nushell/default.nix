{config, ...}: {
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
            event: [
              { edit: Clear }
              { edit: InsertString, value: "${../../scripts/tmux-sessionizer}" }
              { send: Enter }
            ]
          }
          {
            name: tmux_sessionizer_home
            modifier: CONTROL
            keycode: Char_h
            mode: emacs
            event: [
              { edit: Clear }
              { edit: InsertString, value: "${../../scripts/tmux-sessionizer} ${config.home.homeDirectory}" }
              { send: Enter }
            ]
          }
          {
            name: tmux_sessionizer_tmp
            modifier: CONTROL
            keycode: Char_t
            mode: emacs
            event: [
              { edit: Clear }
              { edit: InsertString, value: "${../../scripts/tmux-sessionizer} /tmp" }
              { send: Enter }
            ]
          }
          {
            name: tmux_sessionizer_todo
            modifier: CONTROL
            keycode: Char_g
            mode: emacs
            event: [
              { edit: Clear }
              { edit: InsertString, value: "${../../scripts/tmux-sessionizer} ${config.home.homeDirectory}/todo.md" }
              { send: Enter }
            ]
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
    };
  };
}
