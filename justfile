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
build host=`hostname`:
    nixos-rebuild \
        --flake .#{{ host }} \
        build

# build and activate the config, but do not add it to the boot menu
test host=`hostname`:
    sudo nixos-rebuild \
        --flake .#{{ host }} \
        test

# build the config, activate it, and make it the boot default
switch host=`hostname`:
    sudo nixos-rebuild \
        --flake .#{{ host }} \
        switch

# build the config, activate it, and make it the boot default (remotely)
remote-switch host:
    nixos-rebuild \
        --build-host {{ host }} \
        --target-host {{ host }} \
        --flake .#{{ replace_regex(host, ".*@", "") }} \
        switch
