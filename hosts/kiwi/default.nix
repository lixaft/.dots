{config, ...}: {
  imports = [
    ../../modules/boot.nix
    ../../modules/desktop.nix
    ../../modules/locale.nix
    ../../modules/nix.nix
    ../../modules/shell.nix
    ../../modules/user.nix
    ../../modules/virtualisation.nix
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
