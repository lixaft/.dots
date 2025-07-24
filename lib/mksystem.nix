{
  nixpkgs,
  nix-wsl,
  nix-darwin,
  home-manager,
  nix-index-database,
  ...
} @ inputs: {
  system,
  host,
  user,
  darwin ? {enable = false;},
  wsl ? {enable = false;},
  home ? {enable = false;},
} @ flakeConfig: let
  systemFn =
    if darwin.enable
    then nix-darwin.lib.darwinSystem
    else nixpkgs.lib.nixosSystem;

  args = {
    inputs = inputs;
    flakeConfig = flakeConfig;
    flakeLib = import ./default.nix inputs;
  };
in
  systemFn {
    inherit system;
    modules = [
      {config._module.args = args;}

      (
        if wsl.enable
        then nix-wsl.nixosModules.wsl
        else {}
      )

      (
        if home.enable
        then home-manager.nixosModules.home-manager
        else {}
      )

      (
        if darwin.enable
        then nix-index-database.darwinModules.nix-index
        else nix-index-database.nixosModules.nix-index
      )

      ../host/${host}
      ../user/${user}

      (
        if home.enable
        then {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${user}.imports = [
              nix-index-database.homeModules.nix-index
              ../home
            ];
            extraSpecialArgs = args;
            backupFileExtension = "bak";
          };
        }
        else {}
      )
    ];
  }
