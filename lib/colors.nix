rec {
  fg = "#acacc8";
  bg = "#000000";
  bg2 = black;

  white = "#d0d0f3";
  gray = "#404060";
  black = "#060609";

  blue = "#2b80f0";
  cyan = "#42cdef";
  green = "#a6e22e";
  lavender = "#a29dfa";
  lavender2 = "#6e75a8";
  purple = "#6540f0";
  red = "#e61f44";
  yellow = "#ffa700";

  term = {
    black = ui.dim;
    blue = purple;
    cyan = cyan;
    green = green;
    magenta = lavender;
    red = red;
    white = white;
    yellow = yellow;
  };

  ui = {
    dim = "#101020";
    selection = "#0f0f16";
    separator = ui.dim;
  };

  status = {
    fg = "#303050";
    bg = "#040406";
  };

  syntax = {
    boolean = fg;
    comment = "#303050";
    constant = white;
    function = lavender2;
    identifier = fg;
    keyword = white;
    number = yellow;
    operator = gray;
    punctuation = syntax.comment;
    string = green;
    type = lavender;
  };

  diff = {
    header = syntax.comment;
    added = green;
    changed = blue;
    removed = red;
  };
}
