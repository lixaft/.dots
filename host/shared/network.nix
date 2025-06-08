{flakeConfig, ...}: {
  networking = {
    networkmanager.enable = true;
  };

  users.users.${flakeConfig.user}.extraGroups = [
    "networkmanager"
  ];
}
