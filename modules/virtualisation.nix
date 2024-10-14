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

  environment.systemPackages = with pkgs; [
    virtiofsd
  ];

  users.users.${systemConfig.user} = {
    extraGroups = [
      "libvirtd"
      "podman"
    ];
  };
}
