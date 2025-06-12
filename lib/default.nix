{nixpkgs, ...} @ inputs: {
  colors = import ./colors.nix;
  mkSystem = import ./mksystem.nix inputs;

  inherit (import ./utils.nix {inherit (nixpkgs) lib;}) concatAttrs hexToInt parseHexColor;
}
