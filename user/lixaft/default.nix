{
  pkgs,
  flakeConfig,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nushell
  ];

  users.users.${flakeConfig.user} = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = ["wheel"];
  };
}
