rec {
  fg = "#acacc8";
  bg = "#000000";

  bg2 = black;

  white = "#d0d0f3";
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
    blue = purple;
    yellow = yellow;
    black = ui.dim;
    white = white;
    red = red;
    green = green;
    magenta = lavender;
    cyan = cyan;
  };

  ui = {
    dim = "#101020";
    separator = ui.dim;
    selection = "#0f0f16";
  };

  status = {
    fg = "#303050";
    bg = "#040406";
  };

  syntax = {
    string = green;
    number = yellow;
    type = lavender;
    function = lavender2;
    comment = "#303050";
    operator = "#404060";
  };
}
