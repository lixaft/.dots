{pkgs, ...}: {
  wayland.windowManager.hyprland = let
    mod = "SUPER";
  in {
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
        drop_shadow = false;
        rounding = 0;
      };

      animations.enabled = false;

      dwindle = {
        force_split = 2;
        preserve_split = true;
      };

      input.follow_mouse = 0;

      cursor.inactive_timeout = 3;

      bind = [
        "${mod}, q, exit"
        "${mod}, t, exec, ${pkgs.alacritty}/bin/alacritty"
        "${mod}, c, killactive"
        "${mod}, e, exec, ${pkgs.pcmanfm}/bin/pcmanfm"
        "${mod}, v, togglefloating"
        "${mod}, f, fullscreen"
        "${mod}, d, exec, rofi -theme ${../rofi/launcher.rasi} -show"
        "${mod}, p, exec, ${pkgs.hyprpicker}/bin/hyprpicker --autocopy --format=hex"
        '', Print, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -b 000000AA -w 1 -c FFFFFF80-d)" - | wl-copy''

        "${mod}, l, movefocus, l"
        "${mod}, h, movefocus, r"
        "${mod}, j, movefocus, u"
        "${mod}, k, movefocus, d"

        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
        "${mod}, 6, workspace, 6"
        "${mod}, 7, workspace, 7"
        "${mod}, 8, workspace, 8"
        "${mod}, 9, workspace, 9"

        "${mod}, F1, movetoworkspace, 1"
        "${mod}, F2, movetoworkspace, 2"
        "${mod}, F3, movetoworkspace, 3"
        "${mod}, F4, movetoworkspace, 4"
        "${mod}, F5, movetoworkspace, 5"
        "${mod}, F6, movetoworkspace, 6"
        "${mod}, F7, movetoworkspace, 7"
        "${mod}, F8, movetoworkspace, 8"
        "${mod}, F9, movetoworkspace, 9"
      ];

      bindm = [
        "${mod}, mouse:272, movewindow"
        "${mod}, mouse:273, resizewindow"
      ];

      bindl = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"

        # Remove borders when there is only one window in the workspace.
        "noborder, onworkspace:w[t1]"
      ];
    };

    extraConfig = ''
      # Resize mode.
      bind = ${mod}, r, submap, resize
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

  services.hyprpaper = {
    enable = true;
    settings = let
      img = "${../../../wall.png}";
    in {
      preload = img;
      wallpaper = ",${img}";
    };
  };
}
