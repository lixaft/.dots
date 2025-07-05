{...}: {
  home.shellAliases = {
    j = "jj";
  };

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Fabien Taxil";
        email = "me@lixaft.dev";
      };

      ui = {
        default-command = ["log"];
        paginate = "never";
      };
    };
  };
}
