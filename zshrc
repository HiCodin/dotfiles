POWERLEVEL9K_INSTALLATION_PATH=~/.zim/modules/prompt/external-themes/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)

POWERLEVEL9K_OS_ICON_BACKGROUND="231"
POWERLEVEL9K_OS_ICON_FOREGROUND="012"
POWERLEVEL9K_DIR_HOME_FOREGROUND="231"
POWERLEVEL9K_DIR_HOME_BACKGROUND="012"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="231"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="012"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="231"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="012"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="046"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="232"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='231'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='red'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='231'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='215'
POWERLEVEL9K_STATUS_OK_BACKGROUND="232"

#
# User configuration sourced by interactive shells
#

export TERM="xterm-256color"

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi


#eval "$(thefuck --alias)"

source ~/.zsh_aliases