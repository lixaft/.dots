{pkgs, ...}: {
  home.packages = with pkgs; [
    ankama-launcher
  ];
}
