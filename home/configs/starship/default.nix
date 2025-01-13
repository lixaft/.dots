{...}: {
  programs.starship = {
    enable = true;
    settings = {
      format = "$directory $git_branch $character";
    };
  };
}
