{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        border_size = 2;
        gaps_in = 0;
        gaps_out = 0;
        resize_on_border = true;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
      };

      decoration = {
        blur.enabled = false;
        rounding = 0;
        shadow.enabled = false;
      };

      animations.enabled = false;

      dwindle = {
        force_split = 2;
        preserve_split = true;
      };

      input.follow_mouse = 0;
      cursor.inactive_timeout = 3;

      bind = [
        "SUPER, q, exit"
        "SUPER, t, exec, ${pkgs.alacritty}/bin/alacritty"
        "SUPER, c, killactive"
        "SUPER, e, exec, ${pkgs.alacritty}/bin/alacritty --command ${pkgs.lf}/bin/lf"
        "SUPER, v, togglefloating"
        "SUPER, f, fullscreen"
        "SUPER, d, exec, rofi -theme ${config.xdg.configHome}/rofi/launcher.rasi -show"
        "SUPER, p, exec, ${pkgs.hyprpicker}/bin/hyprpicker --autocopy --format=hex"
        '', Print, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -b 000000AA -w 1 -c FFFFFF80-d)" - | wl-copy''
        "Control_L, Print, exec, ${pkgs.peek}/bin/peek"

        "SUPER, l, movefocus, l"
        "SUPER, h, movefocus, r"
        "SUPER, j, movefocus, u"
        "SUPER, k, movefocus, d"

        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"

        "SUPER, F1, movetoworkspace, 1"
        "SUPER, F2, movetoworkspace, 2"
        "SUPER, F3, movetoworkspace, 3"
        "SUPER, F4, movetoworkspace, 4"
        "SUPER, F5, movetoworkspace, 5"
        "SUPER, F6, movetoworkspace, 6"
        "SUPER, F7, movetoworkspace, 7"
        "SUPER, F8, movetoworkspace, 8"
        "SUPER, F9, movetoworkspace, 9"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, ${pkgs.playerctl}/bin/playerctl play-pause"
        ", XF86AudioPrev, exec, ${pkgs.playerctl}/bin/playerctl previous"
        ", XF86AudioNext, exec, ${pkgs.playerctl}/bin/playerctl next"
      ];

      exec-once = [
        "[workspace 2 silent] ${pkgs.spotify}/bin/spotify"
        "[workspace 3 silent] ${pkgs.alacritty}/bin/alacritty"
        "[workspace 4 silent] ${pkgs.brave}/bin/brave"
        "hyprctl dispatch workspace 3"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"

        # Remove borders when there is only one window in the workspace.
        "noborder, onworkspace:w[t1]"
      ];
    };

    extraConfig = ''
      # Resize mode.
      bind = SUPER, r, submap, resize
      submap = resize
      binde = , l, resizeactive, 50 0
      binde = , h, resizeactive, -50 0
      binde = , k, resizeactive, 0 -50
      binde = , j, resizeactive, 0 50
      bind = , escape, submap, reset
      bind = Ctrl, c, submap, reset
      submap = reset
    '';
  };

  services.hyprpaper = let
    wall = "${../../../misc/wall.png}";
  in {
    enable = true;
    settings = {
      preload = wall;
      wallpaper = ",${wall}";
    };
  };
}
