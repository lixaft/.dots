{
  pkgs,
  systemConfig,
  ...
}: {
  users.users.${systemConfig.user} = {
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups = ["wheel"];
  };

  environment.systemPackages = with pkgs; [
    bash
  ];
}
