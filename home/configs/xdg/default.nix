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
      pictures = "${config.home.homeDirectory}/pictures";
      videos = "${config.home.homeDirectory}/videos";
      music = "${config.home.homeDirectory}/musics";
      publicShare = "${config.home.homeDirectory}";
      templates = "${config.home.homeDirectory}";
    };

    desktopEntries = {
      filebot = {
        name = "FileBot";
        exec = "${pkgs.filebot}/bin/filebot";
        terminal = false;
        categories = ["Application"];
      };

      vm_rocky = {
        name = "Rocky";
        exec = ''virt-manager --connect qemu:///system --show-domain-console "rocky9"'';
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
