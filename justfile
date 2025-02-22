# print this help message
help:
    @just --list

# initialize a new host
init host:
    NIX_CONFIG="experimental-features = nix-command flakes" just switch {{ host }}

# update the flake lock file
update:
    nix flake update

# build the config, but neither activate it nor add it to the boot menu
[positional-arguments]
build host=`hostname`:
    nixos-rebuild build --flake .#{{ host }}

# build and activate the config, but do not add it to the boot menu
[positional-arguments]
test host=`hostname`:
    nixos-rebuild test --flake .#{{ host }}

# build and activate the config, and make it the boot default
[positional-arguments]
switch host=`hostname`:
    nixos-rebuild switch --flake .#{{ host }}

# build and activate the config, and make it the boot default
switch-anywhere user=`id -un` host=`hostname`:
    sudo nixos-anywhere -S --flake ".#{{ host }}" {{ user }}@{{ host }}
