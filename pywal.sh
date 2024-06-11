#!/usr/bin/env bash

pywal_options=(-i)
rofi_title="colorschemes:"
rofi_colors=(
    -bc "#222222" \
    -bg "#111111" \
    -fg "#bbbbbb" \
    -hlfg "#111111" \
    -hlbg "#bbbbbb"
)
rofi_options=(
    -width -30 \
    -bw 2 \
    -dmenu -i \
    -p "${rofi_title}" "${rofi_colors}" \
    -lines 10
)

wallpapers_dir="$HOME/Pictures/wallpapers"

if [ ! -d "$wallpapers_dir" ]; then
    echo "The wallpapers directory does not exist: $wallpapers_dir"
    exit 1
fi

typeset -A menu
for file in $(find "$wallpapers_dir" -type f -regex '.*\(jpg\|png\)$'); do
    file_name=${file##*/}
    menu[${file_name%%.*}]=$file
done


launch_rofi=(rofi "${rofi_options[@]}")
selection="$(printf '%s\n' "${!menu[@]}" | sort | "${launch_rofi[@]}")"


if [ ! -z $selection ]; then
  wal $pywal_options "${menu[${selection}]}"
  oomox-archdroid-icons-cli -o wal ~/.cache/wal/colors-oomox
  oomox-cli -o wal ~/.cache/wal/colors-oomox
fi


