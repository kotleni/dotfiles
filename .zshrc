setup_history() {
    HISTFILE="$HOME/.zsh_history"
    HISTSIZE=50000
    SAVEHIST=50000
    setopt APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE
}

setup_completion() {
    autoload -Uz compinit
    compinit -C
    zstyle ':completion:*' menu select
}

setup_keybindings() {
    bindkey -e

    # Ctrl+Left / Ctrl+Right
    bindkey '^[[1;5D' backward-word
    bindkey '^[[1;5C' forward-word
    bindkey '^[OD' backward-word
    bindkey '^[OC' forward-word

    # Alt+Left / Alt+Right
    bindkey '^[[1;3D' backward-word
    bindkey '^[[1;3C' forward-word
    bindkey '^[^[[D' backward-word
    bindkey '^[^[[C' forward-word
}

setup_prompt() {
    autoload -Uz vcs_info add-zsh-hook
    add-zsh-hook precmd vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' unstagedstr '*'
    zstyle ':vcs_info:git:*' stagedstr '+'
    zstyle ':vcs_info:git:*' formats ' %F{blue}(%F{red}%b%F{yellow}%u%c%F{blue})%f'
    zstyle ':vcs_info:git:*' actionformats ' %F{blue}(%F{red}%b|%a%F{blue})%f'

    setopt PROMPT_SUBST
    PROMPT='%B%F{green}%n@%m%f %F{blue}%1~${vcs_info_msg_0_} %#%f%b '
}

setup_env() {
    typeset -U path
    path=("$HOME/.local/bin" "$HOME/.cargo/bin" $path)

    export LANG=en_US.UTF-8
    export EDITOR='nvim'
    unset -f command_not_found_handler 2>/dev/null
}

setup_pager() {
    export LESS_TERMCAP_mb=$'\e[1;34m'     # begin bold
    export LESS_TERMCAP_md=$'\e[1;32m'     # begin blink
    export LESS_TERMCAP_so=$'\e[01;44;37m' # begin reverse video
    export LESS_TERMCAP_us=$'\e[01;36m'    # begin underline
    export LESS_TERMCAP_me=$'\e[0m'        # reset bold/blink
    export LESS_TERMCAP_se=$'\e[0m'        # reset reverse video
    export LESS_TERMCAP_ue=$'\e[0m'        # reset underline
    export GROFF_NO_SGR=1                  # for konsole and gnome-terminal
    export MANPAGER='less -s -M +Gg'
}

setup_dfgit() {
    alias dfgit='/usr/bin/git --git-dir=$HOME/.dotfilesgit/ --work-tree=$HOME'
    compdef dfgit=git
}

setup_history
setup_completion
setup_keybindings
setup_prompt
setup_env
setup_pager
setup_dfgit

unfunction setup_history setup_completion setup_prompt setup_keybindings
unfunction setup_env setup_pager setup_dfgit
