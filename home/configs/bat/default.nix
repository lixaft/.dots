{ inputs, pkgs, ... }:
{
  home.shellAliases = {
    cat = "${pkgs.bat}/bin/bat";
    diff = "${pkgs.bat-extras.batdiff}/bin/batdiff";
    man = "${pkgs.bat-extras.batman}/bin/batman";
  };

  xdg.configFile = {
    "bat/themes/tokyonight.tmTheme".source = "${inputs.tokyonight}/extras/sublime/tokyonight_night.tmTheme";
  };

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batgrep
      batman
      batpipe
      batwatch
      prettybat
    ];

    config = {
      theme = "tokyonight";
    };
  };
}
