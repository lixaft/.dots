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
        pager = ":builtin";
        streampager = {
          show-ruler = false;
        };
      };

      templates = {
        log = "format_commit_summary_with_refs(self, bookmarks)";
      };
    };
  };
}
