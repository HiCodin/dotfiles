source ~/.git-completion.bash
source ~/.git-prompt.sh

[ -f $HOME/.bashrc ] && source $HOME/.bashrc

ORANGE="\[\e[38;5;202m\]"
WHITE="\[\e[38;5;15m\]"
RESET="\[\e[0m\]"
BLUE="\[\e[38;5;75m\]"
TEXT="\[\e[38;5;208m\]"
GREEN="\[\e[38;5;46m\]"
RED="\[\e[38;5;196m\]"
ARROW="\342\236\234"
USER="\342\231\232"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export PS1=$TEXT"\u "$WHITE"in"$BLUE" \w"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$RED'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$ORANGE'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$GREEN'"$(__git_ps1 " (%s)")
    fi)'$ORANGE" $ARROW$RESET "

__git_complete g __git_main

