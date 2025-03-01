{flakeConfig, ...}: {
  users.users.${flakeConfig.user} = {
    isNormalUser = true;
    description = "${flakeConfig.user}";
    extraGroups = ["wheel"];
  };
}
