source ~/.git-completion.bash
source ~/.git-prompt.sh

[ -f $HOME/.bashrc ] && source $HOME/.bashrc

ORANGE="\[\e[38;5;202m\]"
YELLOW="\[\e[38;5;227m\]"
WHITE="\e[1;37m"
RESET="\[\e[0m\]"
BLUE="\e[38;5;75m"
PINK="\[\e[38;5;212m\]"
USER="\[\e[38;5;48m\]"
GREEN="\[\e[38;5;46m\]"
RED="\[\e[38;5;196m\]"
VIOLET="\e[1;35m"
GIT_PS1_SHOWDIRTYSTATE=true
export LS_OPTIONS='--color=auto'
export CLICOLOR='Yes'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

#function pc {
##[ -d .git ] && git name-rev --name-only @ && echo "●"
#}

# Prompt is copied from Mathias’s dotfiles: https://github.com/mathiasbynens/dotfiles

prompt_git() {
    local s='';
    local branchName='';

    # Check if the current directory is in a Git repository.
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

            # Ensure the index is up to date.

            if ! $(git update-index --really-refresh -q); then
                s+='....';
            fi;

            # Check for uncommitted changes in the index.
            if ! $(git diff --quiet --ignore-submodules --cached); then
                s+='+';
            fi;

            # Check for unstaged changes.
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s+='!';
            fi;

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+='?';
            fi;

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+='$';
            fi;

        fi;

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')";

        [ -n "${s}" ] && s=" [${s}]";

        echo -e "${1}${branchName}${2}${s}";
    else
        return;
    fi;
}

PS1=$USER"\u "$WHITE"in"$BLUE" \w"
PS1+="\$(prompt_git \"\[${WHITE}\] on \[${VIOLET}\]\" \"\[${BLUE}\]\")"; # Git repository details
PS1+="\n\[${WHITE}\]► \[${WHITE}\]";
export PS1;

__git_complete g __git_main
