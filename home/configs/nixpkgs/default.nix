{config, ...}: let
  inherit (config.lib.file) mkOutOfStoreSymlink;
  nixpkgs_dir = "${config.home.homeDirectory}/.dots/home/configs/nixpkgs";
in {
  xdg.configFile = {
    "nixpkgs/config.nix".source = mkOutOfStoreSymlink nixpkgs_dir + "/config.nix";
  };
}
