{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    dconf
  ];

  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  home.pointerCursor = {
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 32;
    gtk.enable = true;
  };

  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = ["user-theme@gnome-shell-extensions.gcampax.github.com"];
    };
    "org/gnome/shell/extensions/user-theme" = {
      inherit (config.gtk.theme) name;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
    style.package = pkgs.adwaita-qt;
  };
}
