export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='nvim'
export ARCHFLAGS="-arch $(uname -m)"

alias e="$EDITOR $@"
alias open="xdg-open $@"
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
