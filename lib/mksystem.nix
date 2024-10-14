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
  darwin ? {enable = false;},
  wsl ? {enable = false;},
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

      # Load user and host modules.
      ../hosts/${host}
      ../users/${user}

      # Load home manager configuration module.
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
