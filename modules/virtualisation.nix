{
  pkgs,
  flakeConfig,
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

    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };

  programs = {
    virt-manager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virtiofsd
    docker-compose
  ];

  users.users.${flakeConfig.user} = {
    extraGroups = [
      "libvirtd"
    ];
  };
}
