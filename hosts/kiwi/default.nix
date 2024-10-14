{
  config,
  system,
  ...
}: {
  imports = [
    ../../modules/core.nix
    ../../modules/desktop.nix
    ./hardware.nix
  ];

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  system.stateVersion = system.stateVersion;
}
