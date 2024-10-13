{ pkgs, ... }:
{
  xdg.configFile = {
    "litecli/config".text = ''
      syntax_style = native
    '';
  };

  home.shellAliases = {
    "sqlite" = "${pkgs.litecli}/bin/litecli";
  };

  home.packages = with pkgs; [
    litecli
  ];
}
