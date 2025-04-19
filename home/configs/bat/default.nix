{
  inputs,
  pkgs,
  ...
}: {
  home.shellAliases = {
    cat = "${pkgs.bat}/bin/bat --decorations=never";
    diff = "${pkgs.bat-extras.batdiff}/bin/batdiff";
    man = "${pkgs.bat-extras.batman}/bin/batman";
  };

  xdg.configFile = {
    "bat/themes/flake.tmTheme".source = ./theme.nix inputs;
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
