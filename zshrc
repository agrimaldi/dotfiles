# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    curl -sL zplug.sh/installer | zsh
fi

source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
# zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*linux*amd64*"
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*darwin*amd64*"
# zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
# zplug "junegunn/fzf", use:"shell/key-bindings.zsh"
zplug "junegunn/fzf", use:"shell/completion.zsh"
zplug "zsh-users/zsh-completions", use:src
zplug "zsh-users/zsh-autosuggestions"
zplug "mollifier/anyframe"

zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

# POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# POWERLEVEL9K_SHORTEN_DELIMITER=""
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

PROMPT_GEOMETRY_COLORIZE_SYMBOL=true
PROMPT_GEOMETRY_EXEC_TIME=true
zplug "frmendes/geometry"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load


alias sm="emacsclient -a \"\" -t "
alias ll="ls -lh"
alias lt="ls -lthr"


HISTFILE=$HOME/.zhistory       # enable history saving on shell exit
setopt APPEND_HISTORY          # append rather than overwrite history file.
HISTSIZE=12000                  # lines of history to maintain memory
SAVEHIST=12000                  # lines of history to maintain in history file.
# setopt HIST_EXPIRE_DUPS_FIRST  # allow dups, but expire old ones when I hit HISTSIZE
setopt EXTENDED_HISTORY        # save timestamp and runtime information


# Do menu-driven completion.
zstyle ':completion:*' menu select
# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'


ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd


autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic


FZF_COMPLETION_TRIGGER=';'
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
bindkey '^xb' anyframe-widget-cdr
bindkey '^x^b' anyframe-widget-checkout-git-branch
bindkey '^xr' anyframe-widget-execute-history
bindkey '^x^r' anyframe-widget-execute-history
bindkey '^xi' anyframe-widget-put-history
bindkey '^x^i' anyframe-widget-put-history
bindkey '^xk' anyframe-widget-kill
bindkey '^x^k' anyframe-widget-kill
# bindkey '^xe' anyframe-widget-insert-git-branch
# bindkey '^x^e' anyframe-widget-insert-git-branch


autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
