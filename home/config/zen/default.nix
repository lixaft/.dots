{pkgs, ...}: {
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = with pkgs; [
      firefoxpwa
    ];
  };

  # Web applications setup.
  home.packages = with pkgs; [
    firefoxpwa
  ];
}
