
#!/usr/bin/env bash

rofi_title="Wallpapers"
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

# Select backend color generator
selected_backend=$(echo -e "wal\ncolorthief\ncolorz\nhaishoku" | rofi -dmenu -p "Select backend:" "${rofi_colors}")

# Check if the selection is valid
if [[ ! "$selected_backend" =~ ^(wal|colorthief|colorz|haishoku)$ ]]; then
    echo "Invalid selection!"
    exit 1
fi

wallpapers_dir="$HOME/Pictures/Wallpapers"

if [ ! -d "$wallpapers_dir" ]; then
    echo "The wallpapers directory does not exist: $wallpapers_dir"
    exit 1
fi

typeset -A menu
for file in $(find "$wallpapers_dir" -type f -regex '.*\(jpg\|png\)$'); do
    file_name=${file##*/}
    menu[${file_name%%.*}]=$file
done

# Launch rofi to select wallpaper
launch_rofi=(rofi "${rofi_options[@]}")
selection="$(printf '%s\n' "${!menu[@]}" | sort | "${launch_rofi[@]}")"

if [ ! -z "$selection" ]; then
  wal --backend "$selected_backend" -i "${menu[${selection}]}"
  oomox-archdroid-icons-cli -o wal ~/.cache/wal/colors-oomox
  oomox-cli -o wal ~/.cache/wal/colors-oomox
fi

