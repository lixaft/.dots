{
  lib,
  pkgs,
  ...
}: {
  home.shellAliases = {
    # TODO: IDK why, but interactive does not seem to be picked up. Aliasing it
    # at the shell level bypasses the issue, but I should probably fix it.
    bash = lib.getExe pkgs.bashInteractive;
  };

  programs.bash = {
    enable = true;
  };
}
