{
  pkgs,
  flakeConfig,
  ...
}: {
  users.users.${flakeConfig.user} = {
    isNormalUser = true;
    shell = pkgs.bashInteractive;
    extraGroups = ["wheel"];
  };
}
