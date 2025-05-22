{
  pkgs,
  flakeConfig,
  ...
}: {
  users.users.${flakeConfig.user} = {
    shell = pkgs.nushell;
    extraGroups = ["dialout"];
  };

  environment.systemPackages = with pkgs; [
    nushell
  ];
}
