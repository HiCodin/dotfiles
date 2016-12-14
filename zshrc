#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
    source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
export TERM="xterm-256color"
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH=$PATH:/usr/local/mysql/bin
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/sbin:$PATH"

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
    source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

eval "$(thefuck --alias)"
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"

source ~/.zsh_aliases

function take() {
    mkdir -p $1
    cd $1
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
