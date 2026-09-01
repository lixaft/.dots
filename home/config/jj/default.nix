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

      aliases = {
        update = ["rebase" "-b" "heads(all()) ~ immutable()" "-d" "main"];
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

        revert_description = ''
          concat(
            'revert "' ++ description.first_line() ++ '"' ++ "\n",
            "\n",
            "This reverts commit " ++ commit_id ++ ".\n",
          )
        '';
      };
    };
  };
}
