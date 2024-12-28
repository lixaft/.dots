{
  pkgs,
  config,
  ...
}: {
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;

      desktop = "${config.home.homeDirectory}/desktop";
      documents = "${config.home.homeDirectory}/documents";
      download = "${config.home.homeDirectory}/downloads";
      music = "${config.home.homeDirectory}/musics";
      pictures = "${config.home.homeDirectory}/pictures";
      publicShare = "${config.home.homeDirectory}/public";
      templates = "${config.home.homeDirectory}/templates";
      videos = "${config.home.homeDirectory}/videos";
    };

    desktopEntries = {
      filebot = {
        name = "FileBot";
        icon = ./filebot.svg;
        exec = "${pkgs.filebot}/bin/filebot";
        terminal = false;
        categories = ["Application"];
      };
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/jpeg" = "qimgv.desktop";
        "image/png" = "qimgv.desktop";
      };
    };
  };
}
