{...}: {
  xdg = {
    desktopEntries."lf" = {
      name = "Lf";
      genericName = "File Manager";
      exec = "alacritty --command lf";
      categories = [];
    };

    configFile = {
      "lf/colors".source = ./colors;
      "lf/icons".source = ./icons;
    };
  };

  programs.lf = {
    enable = true;

    settings = {
      number = true;
      relativenumber = true;
      drawbox = true;
      hidden = true;
      icons = true;
    };

    previewer.source = ./pv.sh;
  };
}
