#!/usr/bin/env bash
id=$1
numbers="󰎣󰎦󰎩󰎬󰎮󰎰󰎵󰎸󰎻󰎾"

for ((i = 0; i < ${#id}; i++)); do
    digit=${id:i:1}
    echo -n "${numbers:digit:1} "
done
