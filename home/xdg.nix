{
  config,
  lib,
  pkgs,
  ...
}: {
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "/tmp";
      music = "${config.home.homeDirectory}/musics";
      pictures = "${config.home.homeDirectory}/pictures";
      publicShare = "${config.home.homeDirectory}/public";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/videos";
    };

    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/jpeg" = "qimgv.desktop";
        "image/png" = "qimgv.desktop";
        "image/svg+xml" = "brave-browser.desktop";
      };
    };

    desktopEntries = {
      filebot = {
        name = "FileBot";
        icon = ./resource/filebot.svg;
        exec = lib.getExe pkgs.filebot;
        terminal = false;
        categories = ["Application"];
      };
    };
  };
}
