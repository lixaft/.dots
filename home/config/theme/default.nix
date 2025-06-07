{pkgs, ...}: {
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };

  qt = {
    enable = true;
  };

  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["DejaVuSansM Nerd Font"];
    };
  };
}
