{flakeLib, ...}: let
  c = flakeLib.colors;
in {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$nix_shell$status$character";

      character = {
        format = "[➜](${c.syntax.comment}) ";
      };
      directory = {
        truncation_symbol = "…/";
        style = "bold ${c.lavender}";
      };
      git_branch = {
        format = "[\\(](${c.syntax.comment})[$branch]($style)[\\)](${c.syntax.comment}) ";
        style = "${c.lavender2}";
      };
      status = {
        disabled = false;
        format = "[\\[$status\\]]($style) ";
        style = "bold ${c.red}";
      };
      nix_shell = {
        format = "[\\[nix\\]]($style) ";
        style = "cyan";
      };
    };
  };
}
