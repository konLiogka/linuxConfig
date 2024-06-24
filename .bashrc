#
# ~/.bashrc
#
(cat ~/.cache/wal/sequences &)

source ~/.cache/wal/colors-tty.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'


PS1="\[\e[32m\]┌[\[\e[36m\] \u\[\e[32m\]@\[\e[33m\]\h \[\e[32m\]]-[\[\e[34m\] \w \[\e[32m\]]\n\[\e[32m\]└─·> \[\e[0m\]"


alias luamake="/home/kliogka/.config/nvim/lua-language-server/3rd/luamake/luamake"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias la="ls -A"
alias cls="clear"
alias h="history"

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push origin"

alias dnsconf="~/Documents/Scripts/dnsconf.sh"
alias ezip="~/Documents/Scripts/ezip.sh"
alias hdmiset="~/Documents/Scripts/hdmi.sh"
alias rmirror="~/Documents/Scripts/rmirror.sh"
alias dmanga="~/Documents/Scripts/dmanga.sh"
alias batthealth="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias rofiwal="~/Documents/Scripts/rofiwal.sh"
alias gdu="alacritty -e gdu"


alias omori="alacritty -e ~/Games/OMORI-jc141/start.e-w.sh"
alias tr1x="alacritty -e ~/Games/Tomb-Raider-I/TR1X.exe"
alias terraria="alacritty -e ~/Games/Terraria-jc141/start.n.sh"
alias undertale="alacritty -e ~/Games/Undertale-jc141/start.n.sh"
alias rainworld="alacritty -e ~/Games/Rain.World-jc141/start.n-w.sh"
alias hollowknight="alacritty -e ~/Games/Hollow.Knight-jc141/start.n.sh"
alias plagueinc="alacritty -e ~/Games/Plague.Inc.Evolved-jc141/start.n.sh"
alias stardew="alacritty -e ~/Games/Stardew.Valley-jc141/start.n.sh"


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

