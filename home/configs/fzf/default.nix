{pkgs, ...}: {
  programs.fzf = {
    enable = true;
    defaultCommand = "${pkgs.fd}/bin/fd --highlight-line --info=inline-right --ansi --layout=reverse --border=none";
    colors = {
      "bg+" = "-1";
      "bg" = "-1";
      "border" = "#565f89";
      "fg+" = "#41a6b5";
      "fg" = "#c0caf5";
      "header" = "#565f89";
      "hl+" = "#73daca";
      "hl" = "#7aa2f7";
      "info" = "#565f89";
      "marker" = "#41a6b5";
      "pointer" = "#41a6b5";
      "prompt" = "#565f89";
      "spinner" = "#565f89";
    };
  };
}
