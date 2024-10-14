{systemConfig, ...}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      warn-dirty = false;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = ["python"];
  };

  programs = {
    nix-ld.enable = true;
  };

  system.stateVersion = systemConfig.stateVersion;
}
