source ~/.git-completion.bash
source ~/.git-prompt.sh

YELLOWISH="\[\e[38;5;202m\]"
WHITE="\[\e[38;5;15m\]"
UNDBLK="\[\e[4m\]"
RESET="\[\e[24m\]"
BLUE="\[\e[38;5;75m\]"
TEXT="\[\e[1;37m\]"
GREEN="\[\e[38;5;46m\]"
RED="\[\e[38;5;196m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export PS1=$UNDBLK$TEXT"\u"'$(
    if [[ $(__git_ps1) =~ \*\)$ ]]
    # a file has been modified but not added
    then echo "'$RESET$RED'"$(__git_ps1 " (%s)")
    elif [[ $(__git_ps1) =~ \+\)$ ]]
    # a file has been added, but not commited
    then echo "'$RESET$YELLOWISH'"$(__git_ps1 " (%s)")
    # the state is clean, changes are commited
    else echo "'$RESET$GREEN'"$(__git_ps1 " (%s)")
    fi)'$RESET$BLUE" \w"$WHITE" -> "

alias l='ls -lah'
alias g='git'
alias gs='git status'
__git_complete g __git_main
