{
  flakeLib,
  lib,
  pkgs,
  ...
}: let
  c = flakeLib.colors;
in {
  programs.fzf = {
    enable = true;
    defaultCommand = "${lib.getExe pkgs.fd} --highlight-line --info=inline-right --ansi --layout=reverse --border=none";
    colors = {
      "bg" = "-1";
      "bg+" = "-1";
      "border" = c.ui.separator;
      "fg" = c.fg;
      "fg+" = c.lavender;
      "gutter" = c.bg;
      "header" = c.red;
      "hl" = c.red;
      "hl+" = c.red;
      "info" = c.syntax.comment;
      "marker" = c.yellow;
      "pointer" = c.lavender;
      "prompt" = c.syntax.comment;
      "spinner" = c.syntax.comment;
    };
  };
}
