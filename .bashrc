#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias myip='curl https://ipinfo.io/ip'
alias ls='ls --color=auto'
alias qute='qutebrowser'
alias up='cd ..'
alias less='bat'
alias mv='mv -i'
alias bookworm='com.github.babluboy.bookworm'
alias lsd='ls -la --group-directories-first'
alias fortune='fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n'
alias gitit='git add -A && git commit -am 'autobot' && git push'

## PS1 ##
# PS1='[\u@\h \W]\$ '
#export PS1="\[\033[38;5;147m\]\@\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;167m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] [\[$(tput sgr0)\]\[\033[38;5;147m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]>\n\[$(tput sgr0)\]\[\033[38;5;167m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export PS1="\[\033[38;5;196m\][\A]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;182m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;8m\]@\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;188m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;8m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

## restic defaults ##
export B2_ACCOUNT_ID="753810edffe2"
export B2_ACCOUNT_KEY="0023a7e09b283779754a5e301264c54f3882f69576"
export RESTIC_REPOSITORY="b2:booklib"

## default vim ##
export VISUAL=vim
export EDITOR=vim

## wine ##
export WINEPREFIX=/home/$USER/wine

## USB subsys in VB ##
VBOX_USB=usbfs
