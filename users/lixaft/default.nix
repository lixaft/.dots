{
  pkgs,
  systemConfig,
  ...
}: {
  users.users.${systemConfig.user} = {
    shell = pkgs.fish;
  };

  programs = {
    fish.enable = true;
  };
}
