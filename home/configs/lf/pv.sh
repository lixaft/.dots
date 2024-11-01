#!/usr/bin/env bash

case "$(file -Lb --mime-type -- "$1")" in
*)
    cat "$1"
    ;;
esac
