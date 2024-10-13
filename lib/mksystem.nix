{
  nixpkgs,
  nix-wsl,
  nix-darwin,
  home-manager,
  ...
}@inputs:
{
  system,
  host,
  user,
  home ? false,
  wsl ? false,
  darwin ? false,
  stateVersion,
}@systemInputs:
let
  systemFn = if darwin then nix-darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;

  specialArgs = {
    inputs = inputs;
    system = systemInputs;
  };

  wslModule = nix-wsl.nixosModules.wsl;
  homeModule = home-manager.nixosModules.home-manager;

  homeConfig = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.${user}.imports = [ ../home ];
      extraSpecialArgs = specialArgs;
      backupFileExtension = "bak";
    };
  };
in
systemFn {
  inherit system;
  modules = [
    { config._module.args = specialArgs; }

    (if wsl then wslModule else { })

    ../hosts/${host}

    (if home then homeModule else { })
    (if home then homeConfig else { })
  ];
}
