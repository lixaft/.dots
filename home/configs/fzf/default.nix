{ ... }:
{
  programs.fzf = {
    enable = true;
    defaultCommand = "fd --highlight-line --info=inline-right --ansi --layout=reverse --border=none";
    colors = {
      "bg+" = "-1";
      "bg" = "-1";
      "border" = "#565f89";
      "fg+" = "#c0caf5";
      "fg" = "#c0caf5";
      "header" = "#565f89";
      "hl+" = "#7aa2f7";
      "hl" = "#7aa2f7";
      "info" = "#565f89";
      "marker" = "#9ece6a";
      "pointer" = "#9d7cd8";
      "prompt" = "#565f89";
      "spinner" = "#565f89";
    };
  };
}
