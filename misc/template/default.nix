{...}: rec {
  generic = {path = ./generic;};
  python = {path = ./python;};
  default = generic;
}
