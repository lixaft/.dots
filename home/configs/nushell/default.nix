{config, ...}: {
  programs.nushell = {
    enable = true;

    configFile.source = ./config.nu;

    extraConfig =
      # nu
      ''
        source ${config.xdg.cacheHome}/zoxide/init.nu

        def --env __smart_cd [path?] {
            if ($path != null or $env.TMUX? == null) {
                z $path
            } else {
                let session_path = tmux display-message -p "#{session_path}"
                z $session_path
            }
        }
      '';

    shellAliases = {
      "l" = "l";
      "la" = "ls -a";
      "lla" = "ls -la";

      "cd" = "__smart_cd";
      "ci" = "zi";
      "-" = "cd -";
    };
  };
}
