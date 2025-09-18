{
  config,
  lib,
  pkgs,
  ...
}: {
  home.shellAliases = {
    stim-vpn = "sudo ${lib.getExe pkgs.openfortivpn} -c ${config.xdg.configHome}/openfortivpn/stim.conf";
  };

  home.packages = with pkgs; [
    openfortivpn
    remmina
  ];
}
