#!/bin/bash


declare -A categories
categories["Messaging"]="discord session-messenger-desktop"
categories["Browsing"]="floorp firefox librewolf"
categories["Graphics"]="krita inkscape libreoffice"
categories["Music"]="parole ToneLib-Zoom soulseekqt reaper audacity"
categories["Coding"]="code arduino qtcreator"
categories["Tools"]="lxappearance localsend virt-manager fdm"
categories["Networking"]="gns3 packettracer wireshark"
categories["Games"]="steam supertuxkart omori tr1x terraria undertale rainworld hollowknight plagueinc stardew"

state="categories"
while true; do
    if [ "$state" = "categories" ]; then
        selected_category=$(printf '%s\n' "${!categories[@]}" | rofi -dmenu -p "Categories")
        
        if [ -n "$selected_category" ]; then
            apps=${categories[$selected_category]}
            chosen=$(echo "$apps" | tr ' ' '\n' | rofi -dmenu -p "$selected_category")
            if [ -n "$chosen" ]; then
                exec bash -i -c "$chosen" 
            fi 
        else
            break
        fi
    elif [ "$state" = "applications" ]; then
        state="categories"
    fi
done
