{
  pkgs,
  flakeLib,
  ...
}: let
  c = flakeLib.colors;
in {
  programs.fzf = {
    enable = true;
    defaultCommand = "${pkgs.fd}/bin/fd --highlight-line --info=inline-right --ansi --layout=reverse --border=none";
    colors = {
      "bg+" = "-1";
      "bg" = "-1";
      "border" = c.ui.dim;
      "fg+" = c.lavender;
      "fg" = c.fg;
      "header" = c.red;
      "hl+" = c.green;
      "hl" = c.green;
      "info" = c.syntax.comment;
      "marker" = c.yellow;
      "pointer" = c.lavender;
      "prompt" = c.syntax.comment;
      "spinner" = c.syntax.comment;
    };
  };
}
