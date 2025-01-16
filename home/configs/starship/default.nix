{...}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$status$character";

      character = {
        format = "[➜](bold) ";
      };
      directory = {
        truncation_symbol = "…/";
        style = "bold blue";
      };
      git_branch = {
        format = "\\([$branch]($style)\\) ";
        style = "bold purple";
      };
      status = {
        disabled = false;
        format = "[\\[$status\\]]($style) ";
        style = "bold red";
      };
    };
  };
}
