{config, ...}: {
  imports = [
    ../../module/boot.nix
    ../../module/desktop.nix
    ../../module/locale.nix
    ../../module/nix.nix
    ../../module/shell.nix
    ../../module/user.nix
    ../../module/virtualisation.nix
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
