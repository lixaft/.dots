{
  pkgs,
  flakeConfig,
  ...
}: {
  users.users.${flakeConfig.user} = {
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups = ["wheel"];
  };

  environment.systemPackages = with pkgs; [
    bash
  ];
}
