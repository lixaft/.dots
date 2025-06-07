{config, ...}: {
  imports = [
    ../shared/boot.nix
    ../shared/desktop.nix
    ../shared/locale.nix
    ../shared/nix.nix
    ../shared/shell.nix
    ../shared/user.nix
    ../shared/virtualisation.nix
    ./hardware.nix
  ];

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  system.stateVersion = "23.11";
}
