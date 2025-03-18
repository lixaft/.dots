{...}: {
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
        line-numbers = true;
        line-numbers-minus-style = "#914c54";
        line-numbers-plus-style = "#449dab";
        line-numbers-zero-style = "#3b4261";
        minus-emph-style = "#db4b4b #713137";
        minus-empty-line-marker-style = "#db4b4b #37222c";
        minus-non-emph-style = "#db4b4b #37222c";
        minus-style = "#db4b4b #37222c";
        plus-emph-style = "syntax #2c5a66";
        plus-emptly-line-marker-style = "syntax #20303b";
        plus-non-emph-style = "syntax #20303b";
        plus-style = "syntax #20303b";
        syntax-theme = "tokyonight";
      };
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
