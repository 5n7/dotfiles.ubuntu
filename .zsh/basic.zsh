# use color
autoload -Uz colors

# change directory without `cd`
setopt auto_cd
cdpath=('~' '~/src')

# stack directories
setopt auto_pushd
setopt pushd_ignore_dups

setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_remove_slash
setopt correct
setopt globdots
setopt ignore_eof
setopt interactive_comments
setopt magic_equal_subst
setopt no_beep
setopt no_flow_control
setopt numeric_glob_sort
setopt prompt_subst

bindkey '\ef' emacs-forward-word

# completion
fpath+=~/.zfunc

autoload -Uz compinit
compinit

zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

source <(kubectl completion zsh)
