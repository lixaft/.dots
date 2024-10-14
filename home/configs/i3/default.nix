{...}: let
  mod = "Mod4";
  refresh_i3_status = "killall -SIGUSR1 i3blocks";
in {
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      focus.followMouse = false;

      fonts = {
        names = ["DejaVuSansM Nerd Font"];
        size = 18.0;
      };

      window = {
        border = 4;
        hideEdgeBorders = "smart";
        titlebar = false;
      };

      floating = {
        modifier = "${mod}";
        titlebar = true;
      };

      keybindings = {
        # Reload/restart i3.
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";

        # Modes.
        "${mod}+Shift+e" = "mode exit";
        "${mod}+r" = "mode resize";

        # Split window.
        "${mod}+s" = "split h";
        "${mod}+v" = "split v";

        # Change focus.
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        # Move focused window.
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        # Kill focused window.
        "${mod}+Shift+q" = "kill";

        # Switch to workspace.
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";

        # Move container to workspace.
        "${mod}+F1" = "move container to workspace number 1";
        "${mod}+F2" = "move container to workspace number 2";
        "${mod}+F3" = "move container to workspace number 3";
        "${mod}+F4" = "move container to workspace number 4";
        "${mod}+F5" = "move container to workspace number 5";
        "${mod}+F6" = "move container to workspace number 6";
        "${mod}+F7" = "move container to workspace number 7";
        "${mod}+F8" = "move container to workspace number 8";
        "${mod}+F9" = "move container to workspace number 9";

        # Modes.
        "${mod}+f" = "fullscreen toggle";
        "${mod}+Shift+f" = "floating toggle";

        # Applications.
        "${mod}+d" = ''exec --no-startup-id i3-dmenu-desktop --dmenu "dmenu -i -fn 'DejaVuSansM Nerd Font:pixelsize=16'"'';
        "${mod}+Return" = "exec --no-startup-id alacritty";
        "${mod}+e" = ''exec --no-startup-id nautilus'';
        "${mod}+p" = "exec --no-startup-id gpick --pick --single --output --no-newline | xclip -sel clip && true";
        "Print" = "exec --no-startup-id flameshot gui";
        "Shift+Print" = "exec --no-startup-id peek";

        "XF86AudioPlay" = "exec --no-startup-id playerctl play-pause";
        "XF86AudioPrev" = "exec --no-startup-id playerctl previous";
        "XF86AudioNext" = "exec --no-startup-id playerctl next";
        "XF86AudioMute" = "exec --no-startup-id amixer -q sset Master toggle && ${refresh_i3_status}";
        "XF86AudioRaiseVolume" = "exec --no-startup-id amixer -q sset Master 10%+ && ${refresh_i3_status}";
        "XF86AudioLowerVolume" = "exec --no-startup-id amixer -q sset Master 10%- && ${refresh_i3_status}";
      };

      modes = {
        resize = {
          "h" = "resize shrink width 10 px or 10 ppt";
          "j" = "resize grow height 10 px or 10 ppt";
          "k" = "resize shrink height 10 px or 10 ppt";
          "l" = "resize grow width 10 px or 10 ppt";

          "${mod}+r" = "mode default";
          "Escape" = "mode default";
          "Return" = "mode default";
        };
        exit = {
          "l" = "exec i3-msg exit";
          "r" = "exec systemctl reboot";
          "s" = "exec systemctl shutdown";

          "${mod}+Shift+e" = "mode default";
          "Escape" = "mode default";
          "Return" = "mode default";
        };
      };

      bars = [
        {
          mode = "hide";
          statusCommand = "i3status";
        }
      ];
    };
  };

  programs.i3status = {
    enable = true;
  };
}
