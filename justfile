# print this help message
help:
    @just --list

# initialize a new host
init host:
    NIX_CONFIG="experimental-features = nix-command flakes" just switch {{ host }}

alias i := init

# update the flake lock file
update:
    nix flake update

alias u := update

# build the config, but neither activate it nor add it to the boot menu
[positional-arguments]
build host=`hostname`:
    nixos-rebuild build --flake .#{{ host }}

# build and activate the config, but do not add it to the boot menu
[positional-arguments]
test host=`hostname`:
    nixos-rebuild test --use-remote-sudo --flake .#{{ host }}

alias t := test

# build and activate the config, and make it the boot default
[positional-arguments]
switch host=`hostname`:
    nixos-rebuild switch --use-remote-sudo --flake .#{{ host }}

alias s := switch
