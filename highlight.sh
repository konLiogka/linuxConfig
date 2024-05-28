#!/bin/bash

# Define colors
keyword_color='\033[1;34m' # Blue
string_color='\033[0;32m'  # Green
comment_color='\033[0;90m' # Dark Gray
reset_color='\033[0m'       # Reset color

# Highlight keywords
while IFS= read -r line; do
    line="${line//\\/\\\\}"
    line="${line//\"/\\\"}"
    printf "%b\n" "$(sed -e "s/\b\(int\|char\|float\|double\|void\|if\|else\|while\|for\|return\)\b/${keyword_color}&${reset_color}/g" \
        -e "s/\"[^\"]*\"/${string_color}&${reset_color}/g" \
        -e "s/\/\/.*/${comment_color}&${reset_color}/g" \
        -e "s/\/\*[^*]*\*\//${comment_color}&${reset_color}/g" <<< "$line")"
done < "$1"
