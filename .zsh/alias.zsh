alias s='source ~/.zshrc && source ~/.zshenv'

alias apu='sudo apt update && sudo apt upgrade -y'

alias -g G='| grep'
alias -g H='| head'
alias -g L='| less'
alias -g T='| tail'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias ghhome='cd ~/src/github.com/skmatz'
alias gohome='cd ~/go/src/github.com/skmatz'

if [ -d "$HOME/Desktop" ]; then
  alias de='cd ~/Desktop'
fi

if [ -d "$HOME/Downloads" ]; then
  alias dl='cd ~/Downloads'
fi

if [ -d "$HOME/Dropbox" ]; then
  alias dr='cd ~/Dropbox'
fi

if [ -d "$HOME/sandbox" ]; then
  alias sb='cd ~/sandbox'
fi

alias h='history'
alias open='xdg-open'

alias cp='cp -irv'
alias mkdir='mkdir -pv'
alias mv='mv -v'

if type 'broot' >/dev/null 2>&1; then
  alias c='broot'
fi

if type 'cd-gitroot' >/dev/null 2>&1; then
  alias cdg='cd-gitroot'
fi

if type 'docker' >/dev/null 2>&1; then
  alias d='docker'
  alias dim='docker images'
  alias dimp='docker image prune'
  alias dps='docker ps'
  alias dpsa='docker ps -a'
  alias dstrmall='docker stop $(docker ps -aq) && docker rm $(docker ps -aq) -f'
fi

if type 'docker-compose' >/dev/null 2>&1; then
  alias dc='docker-compose'
fi

if type 'exa' >/dev/null 2>&1; then
  alias l='exa -hl --color=auto --git'
  alias la='exa -ahl --color=auto --git'
  alias ls='exa'
fi

if type 'git' >/dev/null 2>&1; then
  alias g='git'
  alias gb='git branch'
  alias gc='git commit'
  alias gcm='git commit -m'
  alias gco='git checkout'
  alias gd='git diff'
  alias gf='git fetch'
  alias gl='git log'
  alias gloo='git log --abbrev-commit --graph'
  alias glooo='git log --pretty=fuller'
  alias gm='git merge'
  alias gp='git push'
  alias gpl='git pull'
  alias gplo='git pull origin'
  alias gplod='git pull origin develop'
  alias gplom='git pull origin master'
  alias gpo='git push origin'
  alias gpod='git push origin develop'
  alias gpom='git push origin master'
  alias gr='git rebase'
  alias gs='git status'
  alias gst='git stash'
  alias gsw='git switch'
fi

if type 'gomi' >/dev/null 2>&1; then
  alias rm='gomi'
fi

if type 'htop' >/dev/null 2>&1; then
  alias top='htop'
fi

if type 'hyperfine' >/dev/null 2>&1; then
  alias time='hyperfine'
fi

if type 'kubectl' >/dev/null 2>&1; then
  alias k='kubectl'
fi

if type 'nvim' >/dev/null 2>&1; then
  alias v='nvim'
  alias vc='nvim ~/.config/nvim'
  alias vd='nvim $DOTFILES'
  alias vim='nvim'
fi

if type 'poetry' >/dev/null 2>&1; then
  alias po='poetry run'
  alias pp='poetry run python'
  alias popup='poetry run pip install --upgrade pip'

  function pdev() {
    poetry add -D black flake8 isort mypy pytest
  }
fi

if type 'pre-commit' >/dev/null 2>&1; then
  alias pc='pre-commit'
fi

if type 'python' >/dev/null 2>&1; then
  alias pipr='pip install -r requirements.txt'
  alias pipup='pip install --upgrade pip'
  alias py='python'
  alias py2='python2'
  alias py3='python3'
  alias venv='python -m venv .venv && source .venv/bin/activate'
fi

if type 'tmux' >/dev/null 2>&1; then
  alias tt='tmux attach -t default || tmux new -s default'
fi

if type 'xsel' >/dev/null 2>&1; then
  alias pbc='xsel --clipboard --input'
  alias pbp='xsel --clipboard --output'
fi

function mkcd() {
  mkdir -p $1
  cd $1
}

function mkpy() {
  mkdir -p $1
  touch $1/__init__.py
}

function restart-mozc() {
  killall ibus-daemon
  ibus-daemon -d -x &
}

function targz() {
  tar -zcvf $1.tar.gz $1
}

function untargz() {
  tar -zxvf $1
  rm -f $1
}

function zbuf() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N zbuf
bindkey '^Z' zbuf
