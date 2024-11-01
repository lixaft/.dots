{inputs, ...}: {
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
    };

    aliases = {
      git = "!git";
      l = "ll -16";
      ll = "log --abbrev-commit --date=relative --pretty='%C(bold red)%h%C(reset) - %s %C(bold yellow)%d%C(reset) %C(bold green)(%cr) %C(bold blue)<%an>%C(reset)'";
      rg = "grep --heading --line-number";
      oops = "commit --amend --no-edit";
      undo = "reset --soft HEAD^";
      fuck = "reset --hard HEAD";
      yolo = "push --force-with-lease origin HEAD";
      norris = "push --force origin HEAD";
      quarante-neuf-trois = "push --force origin HEAD";
      congrat = "blame";
      random = ''"!git commit -m \"$(curl -s https://whatthecommit.com/index.txt)\"'';
      contrib = ''!git log --pretty="%an" | sort | uniq -c | sort -hr'';
    };

    delta = {
      enable = true;
      options = {
        syntax-theme = "tokyonight";
        line-numbers = true;
      };
    };

    includes = [
      {
        path = "${inputs.tokyonight}/extras/delta/tokyonight_night.gitconfig";
      }
      {
        condition = "gitdir:~/dev/stim/";
        contents = {
          user.email = "ftaxil@stimstudio.com";
        };
      }
    ];
  };
}
