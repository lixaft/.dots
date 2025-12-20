export NIX_CONFIG := "experimental-features = nix-command flakes"

_switch:
    @just switch

# print this help message
help:
    @just --list

# update the flake lock file
update:
    nix flake update

# format the source files
fmt:
    nix fmt .
    just --unstable --fmt

# build the config, but neither activate it nor add it to the boot menu
[group("local")]
build name=`hostname`:
    nixos-rebuild \
        --flake .#{{ name }} \
        build

# build and activate the config, but do not add it to the boot menu
[group("local")]
test name=`hostname`:
    sudo nixos-rebuild \
        --flake .#{{ name }} \
        test

# build the config, activate it, and make it the boot default
[group("local")]
switch name=`hostname`:
    sudo nixos-rebuild \
        --flake .#{{ name }} \
        switch

# build and activate the config, but do not add it to the boot menu (remotely)
[group("remote")]
remote-test host:
    nixos-rebuild \
        --build-host {{ host }} \
        --target-host {{ host }} \
        --flake .#{{ replace_regex(host, ".*@", "") }} \
        test

# build the config, activate it, and make it the boot default (remotely)
[group("remote")]
remote-switch host:
    nixos-rebuild \
        --build-host {{ host }} \
        --target-host {{ host }} \
        --flake .#{{ replace_regex(host, ".*@", "") }} \
        switch
