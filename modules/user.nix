{systemConfig, ...}: {
  users.users.${systemConfig.user} = {
    isNormalUser = true;
    description = "${systemConfig.user}";
    extraGroups = ["wheel"];
  };
}
