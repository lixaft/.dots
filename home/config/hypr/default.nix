{
  config,
  flakeLib,
  lib,
  pkgs,
  ...
}: let
  c = flakeLib.colors;
  rgb = color: "rgb(${lib.strings.removePrefix "#" color})";
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      general = {
        border_size = 2;
        gaps_in = 0;
        gaps_out = 0;
        resize_on_border = true;
        "col.active_border" = rgb c.lavender;
        "col.inactive_border" = rgb c.ui.separator;
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
        "SUPER, x, exec, loginctl kill-user ${config.home.username}"
        "SUPER, t, exec, ${lib.getExe pkgs.alacritty}"
        "SUPER, c, killactive"
        "SUPER, e, exec, ${lib.getExe pkgs.nautilus} --new-window"
        "SUPER, v, togglefloating"
        "SUPER, f, fullscreen"
        "SUPER, d, exec, rofi -theme ${config.xdg.configHome}/rofi/launcher.rasi -show"
        "SUPER, p, exec, ${lib.getExe pkgs.hyprpicker} --autocopy --format=hex"
        '', Print, exec, ${lib.getExe pkgs.grim} -g "$(${pkgs.slurp}/bin/slurp -b 000000AA -w 1 -c FFFFFF80-d)" - | wl-copy''
        "Control_L, Print, exec, ${lib.getExe pkgs.peek}"

        "SUPER, l, movefocus, r"
        "SUPER, h, movefocus, l"
        "SUPER, j, movefocus, u"
        "SUPER, k, movefocus, d"

        "SUPER CTRL, l, movewindow, r"
        "SUPER CTRL, h, movewindow, l"
        "SUPER CTRL, k, movewindow, u"
        "SUPER CTRL, j, movewindow, d"

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
        ", XF86AudioPlay, exec, ${lib.getExe pkgs.playerctl} play-pause"
        ", XF86AudioPrev, exec, ${lib.getExe pkgs.playerctl} previous"
        ", XF86AudioNext, exec, ${lib.getExe pkgs.playerctl} next"
      ];

      exec-once = [
        "${lib.getExe pkgs.nautilus} --gapplication-service"
        "[workspace 2 silent] ${lib.getExe pkgs.spotify}"
        "[workspace 3 silent] ${lib.getExe pkgs.alacritty}"
        "[workspace 4 silent] ${lib.getExe config.programs.zen-browser.package}"
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
      binde = , l, resizeactive, 128 0
      binde = , h, resizeactive, -128 0
      binde = , k, resizeactive, 0 -128
      binde = , j, resizeactive, 0 128
      bind = , escape, submap, reset
      bind = CTRL, c, submap, reset
      bind = SUPER, r, submap, reset
      submap = reset
    '';
  };

  services.hyprpaper = let
    wall = "${../../resource/wall.png}";
  in {
    enable = true;
    settings = {
      preload = wall;
      wallpaper = ",${wall}";
    };
  };
}
