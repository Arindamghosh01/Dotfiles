#!/bin/bash

        # --match-text "Playing" "--scroll 1" \
        # --match-text "Paused" "--scroll 0" \
# see man zscroll for documentation of the following parameters
zscroll -l 40 \
        --delay 0.1 \
        --scroll-padding "  " \
        --match-command "$HOME/.config/polybar/cuts/scripts/spotify1.sh" \
        --update-check true "$HOME/.config/polybar/cuts/scripts/spotify1.sh" &

wait
