{
  pkgs,
  flakeConfig,
  ...
}: {
  users.users.${flakeConfig.user} = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = ["wheel"];
  };
}
