{
  pkgs,
  systemConfig,
  ...
}: {
  virtualisation = {
    containers.enable = true;

    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = with pkgs; [OVMFFull.fd];
      };
    };

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  programs = {
    virt-manager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virtiofsd
    podman-compose
  ];

  users.users.${systemConfig.user} = {
    extraGroups = [
      "libvirtd"
      "podman"
    ];
  };
}
