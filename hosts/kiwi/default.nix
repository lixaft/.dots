{config, ...}: {
  imports = [
    ../../modules/boot.nix
    ../../modules/locale.nix
    ../../modules/nix.nix
    ../../modules/user.nix
    ../../modules/desktop.nix
    ../../modules/virtualisation.nix
    ./hardware.nix
  ];

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  system.stateVersion = "23.11";
}
