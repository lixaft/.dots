{flakeLib, ...}: let
  c = flakeLib.colors;
  reset = "#[fg=${c.status.fg},bg=${c.status.bg},nobold,noitalics,nounderscore,nodim]";
in {
  programs.tmux = {
    enable = true;

    keyMode = "vi";
    terminal = "tmux-256color";
    mouse = true;

    baseIndex = 1;
    disableConfirmationPrompt = true;
    historyLimit = 50000;
    resizeAmount = 10;

    # Recommended by vim.health.
    escapeTime = 0;
    focusEvents = true;

    extraConfig =
      # tmux
      ''
        # Waiting on https://github.com/nix-community/home-manager/issues/7771
        # to revert back to set this through home manager config (tmux.prefix).
        unbind C-b
        set -g prefix C-a
        bind -N "Send the prefix key through to the application" \
          C-a send-prefix

        set -g default-terminal "tmux-256color"
        set -a terminal-features "$TERM:RGB"

        # Renumber windows when a window is closed.
        set -g renumber-windows on

        # Better copy-mode bindings.
        bind v copy-mode
        bind -T copy-mode-vi v "send-keys -X begin-selection"
        bind -T copy-mode-vi y "send-keys -X copy-selection"

        # Allow switching to previous with `-` like the `cd` command.
        bind - switch-client -l

        # Statusbar.
        bind S run-shell "tmux set -g status \$(tmux show -g -w status | grep -q off && echo on || echo off)"

        # Sane split commands.
        bind | split-window -h -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"
        bind '"' split-window -v -c "#{pane_current_path}"

        # Select window.
        bind -n M-1 select-window -t 1
        bind -n M-2 select-window -t 2
        bind -n M-3 select-window -t 3
        bind -n M-4 select-window -t 4
        bind -n M-5 select-window -t 5
        bind -n M-6 select-window -t 6
        bind -n M-7 select-window -t 7
        bind -n M-8 select-window -t 8
        bind -n M-9 select-window -t 9

        # Pane switch.
        bind -n M-h select-pane -L
        bind -n M-j select-pane -D
        bind -n M-k select-pane -U
        bind -n M-l select-pane -R

        # Pane resize.
        bind -r H resize-pane -L 10
        bind -r J resize-pane -D 10
        bind -r K resize-pane -U 10
        bind -r L resize-pane -R 10

        # # Pane swap.
        # bind -n C-h swap-pane -L
        # bind -n C-j swap-pane -D
        # bind -n C-k swap-pane -U
        # bind -n C-l swap-pane -R

        # Easy sync mode.
        bind Enter setw synchronize-panes

        # Search projects.
        bind C-s run-shell "tmux new-window ${../../bin/tmux-sessionizer}"
        bind t run-shell "${../../bin/tmux-sessionizer} /tmp"
        bind h run-shell "${../../bin/tmux-sessionizer} ~"
        bind g run-shell "${../../bin/tmux-sessionizer} ~/todo.md"

        # Statusbar.
        set -g status-left-length 64
        set -g status-right-length 64

        set -g mode-style "fg=${c.fg},bg=${c.ui.selection}"

        set -g message-style "fg=${c.fg},bg=${c.status.bg}"
        set -g message-command-style "fg=${c.fg},bg=${c.status.bg}"

        set -g menu-style "fg=${c.fg},bg=${c.bg}"
        set -g menu-selected-style "fg=${c.lavender},bg=${c.ui.selection}"

        set -g pane-border-style "fg=${c.ui.separator}"
        set -g pane-active-border-style "fg=${c.ui.separator}"
        set -g pane-border-status off

        set -g status-style "fg=${c.status.fg},bg=${c.status.bg}"

        set -g status-left "${reset}#[fg=${c.lavender},bold]#S  "
        set -g window-status-current-format "${reset}#[fg=${c.white},bold]#I #W  "
        set -g window-status-format "${reset}#I #W  "
        set -g status-right "${reset}%Y-%m-%d   %H:%M"
      '';
  };
}
