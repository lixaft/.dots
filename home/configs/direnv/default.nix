{...}: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    config = {
      log_filter = "^$";
    };
  };
}
