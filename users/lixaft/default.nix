{
  pkgs,
  flakeConfig,
  ...
}: {
  users.users.${flakeConfig.user} = {
    shell = pkgs.nushell;
  };

  environment.systemPackages = with pkgs; [
    nushell
  ];
}
