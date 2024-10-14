{
  nixpkgs,
  nix-wsl,
  nix-darwin,
  home-manager,
  ...
} @ inputs: {
  system,
  host,
  user,
  stateVersion,
  darwin ? {enable = false;},
  wsl ? {enable = false;},
  desktop ? {enable = false;},
  home ? {enable = false;},
} @ systemConfig: let
  systemFn =
    if darwin.enable
    then nix-darwin.lib.darwinSystem
    else nixpkgs.lib.nixosSystem;

  args = {
    inputs = inputs;
    systemConfig = systemConfig;
  };
in
  systemFn {
    inherit system;
    modules = [
      # Pass common arguments to all modules.
      {config._module.args = args;}

      # Load WSL module.
      (
        if wsl.enable
        then nix-wsl.nixosModules.wsl
        else {}
      )

      # Load home manager module.
      (
        if home.enable
        then home-manager.nixosModules.home-manager
        else {}
      )

      # Load system modules.
      ../modules/system/nix.nix
      ../modules/system/boot.nix
      ../modules/system/local.nix
      ../modules/system/user.nix

      # Load user and host modules.
      ../hosts/${host}
      ../users/${user}

      # Load home module.
      (
        if home.enable
        then {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${user}.imports = [../home];
            extraSpecialArgs = args;
            backupFileExtension = "bak";
          };
        }
        else {}
      )
    ];
  }
