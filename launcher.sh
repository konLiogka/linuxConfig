
#!/bin/bash

declare -A categories
categories["Messaging"]="discord session-messenger-desktop"
categories["Browsing"]="floorp firefox librewolf"
categories["Graphics"]="kicad krita inkscape libreoffice"
categories["Music"]="parole ToneLib-Zoom soulseekqt reaper audacity"
categories["Coding"]="code arduino qtcreator android"
categories["Tools"]="obs lxappearance localsend virt-manager fdm rustdesk handbrake"
categories["Networking"]="gns3 packettracer wireshark"
categories["Games"]="steam supertuxkart omori tr1x terraria undertale rainworld hollowknight plagueinc stardew"


all_apps=()
for apps in "${categories[@]}"; do
    for app in $apps; do
        all_apps+=("$app")
    done
done

while true; do

    options=("All" "${!categories[@]}")
    selected_option=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "Categories")
    
    if [ "$selected_option" == "All" ]; then
        selected_app=$(printf '%s\n' "${all_apps[@]}" | rofi -dmenu -p "All")
        if [ -n "$selected_app" ]; then
            exec bash -i -c "$selected_app"
        fi
    elif [ -n "$selected_option" ]; then
        selected_category=$selected_option
        apps=${categories[$selected_category]}
        selected_app=$(echo "$apps" | tr ' ' '\n' | rofi -dmenu -p "$selected_category")
        if [ -n "$selected_app" ]; then
            exec bash -i -c "$selected_app"
        fi
    else
        break
    fi
done

