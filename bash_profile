source ~/.git-completion.bash
source ~/.git-prompt.sh

[ -f $HOME/.bashrc ] && source $HOME/.bashrc

ORANGE="\[\e[38;5;202m\]"
WHITE="\[\e[38;5;15m\]"
RESET="\[\e[0m\]"
BLUE="\[\e[38;5;75m\]"
TEXT="\[\e[38;5;212m\]"
USERNAME="\[\e[38;5;48m\]"
GREEN="\[\e[38;5;46m\]"
RED="\[\e[38;5;196m\]"
ARROW="\342\236\234"
USER="\342\231\232"
DOT="●"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

#function pc {
  #[ -d .git ] && git name-rev --name-only @ && echo "●"
#}

export PS1=$TEXT"╭─● ●─────┤"$USERNAME" ( \u )"$TEXT" ├─────● ●─────┤"$BLUE" ( \w )"$TEXT""'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    then echo "'$RED'" $(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    then echo "'$ORANGE'" $(__git_ps1 " (%s)") 
    else echo "'$GREEN'" $(__git_ps1 " (%s)") 
    fi)'$TEXT" ├─────●  \n╰─➤$RESET "

__git_complete g __git_main

