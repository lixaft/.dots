{...}: {
  home.shellAliases = {
    # There is no executable for `zi`, it is always define inside the
    # shell.
    cdi = "zi";
  };

  programs.zoxide = {
    enable = true;
  };
}
