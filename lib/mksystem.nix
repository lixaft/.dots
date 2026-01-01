{
  nixpkgs,
  nix-wsl,
  nix-darwin,
  home-manager,
  agenix,
  nix-index-database,
  nixarr,
  zen-browser,
  ...
} @ inputs: {
  system,
  host,
  user,
  darwin ? {enable = false;},
  wsl ? {enable = false;},
  home ? {enable = false;},
} @ flakeConfig: let
  lib = nixpkgs.lib;

  mkSystem =
    if darwin.enable
    then nix-darwin.lib.darwinSystem
    else nixpkgs.lib.nixosSystem;

  nixIndexDatabase =
    if darwin.enable
    then nix-index-database.darwinModules.nix-index
    else nix-index-database.nixosModules.nix-index;

  args = {
    inherit inputs flakeConfig;
    flakeLib = import ./default.nix inputs;
  };
in
  mkSystem {
    inherit system;
    specialArgs = args;

    modules =
      [
        ../host/${host}
        ../user/${user}

        nixIndexDatabase
        agenix.nixosModules.default
        nixarr.nixosModules.default
      ]
      ++ lib.optionals wsl.enable [
        nix-wsl.nixosModules.wsl
      ]
      ++ lib.optionals home.enable [
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = args;
            backupFileExtension = "bak";

            users.${user}.imports = [
              zen-browser.homeModules.beta
              nix-index-database.homeModules.nix-index
              ../home
            ];
          };

          # Required because useUserPackages = true;
          environment.pathsToLink = [
            "/share/xdg-desktop-portal"
            "/share/applications"
          ];
        }
      ];
  }
