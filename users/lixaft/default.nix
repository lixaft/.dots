{
  pkgs,
  systemConfig,
  ...
}: {
  users.users.${systemConfig.user} = {
    shell = pkgs.nushell;
  };

  environment.systemPackages = with pkgs; [
    nushell
  ];
}
