{flakeLib, ...}: let
  c = flakeLib.colors;
in {
  programs.git = {
    enable = true;

    userName = "Fabien Taxil";
    userEmail = "me@lixaft.dev";

    extraConfig = {
      advice.statusHints = false;
      color.ui = true;
      core.symlinks = true;
      fetch.prune = true;
      grep.extendedRegexp = true;
      init.defaultBranch = "main";
      merge.tool = "nvimdiff";
      pull.rebase = true;
      rebase.autostash = true;
      safe.directory = "*";

      color.diff = {
        meta = c.diff.header;
        old = c.diff.removed;
        new = c.diff.added;
      };
    };

    aliases = {
      git = "!git";
      oops = "commit --amend --no-edit";
      undo = "reset --soft HEAD^";
      fuck = "reset --hard HEAD";
      yolo = "push --force-with-lease origin HEAD";
      norris = "push --force origin HEAD";
      quarante-neuf-trois = "!git norris";
      congrat = "blame";
      random = ''"!git commit -m \"$(curl -s https://whatthecommit.com/index.txt)\"'';
      contrib = ''!git log --pretty="%an" | sort | uniq -c | sort -hr'';
    };

    includes = [
      {
        condition = "gitdir:~/dev/stim/";
        contents = {
          user.email = "ftaxil@stimstudio.com";
        };
      }
    ];
  };
}
