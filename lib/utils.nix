{lib}: let
  charToInt = c:
    {
      "0" = 0;
      "1" = 1;
      "2" = 2;
      "3" = 3;
      "4" = 4;
      "5" = 5;
      "6" = 6;
      "7" = 7;
      "8" = 8;
      "9" = 9;
      "a" = 10;
      "b" = 11;
      "c" = 12;
      "d" = 13;
      "e" = 14;
      "f" = 15;
    }.${
      lib.toLower c
    };
in rec {
  hexToInt = hexStr:
    lib.foldl (acc: c: acc * 16 + charToInt c) 0 (lib.stringToCharacters hexStr);

  parseHexColor = color: {
    r = hexToInt (builtins.substring 1 2 color);
    g = hexToInt (builtins.substring 3 2 color);
    b = hexToInt (builtins.substring 5 2 color);
  };

  concatAttrs = kv: sep: attrs: let
    pairs = map (name: "${name}=${attrs.${name}}") (builtins.attrNames attrs);
    result = builtins.concatStringsSep ":" pairs;
  in
    result;
}
