# basic
export EDITOR=nvim
export LANG=en_US.UTF-8
export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$HOME/.local/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# dotfiles
export DOTFILES="$HOME/src/github.com/skmatz/dotfiles"
export PATH="$DOTFILES/bin:$PATH"

# fzf
export PATH="$HOME/.fzf/bin:$PATH"

# gcloud
export CLOUDSDK_PYTHON=python3

# go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# python
export PATH="$HOME/.poetry/bin:$PATH"

# machine specific
if [ "$HOST" = "vmlserver02" ]; then
  source $DOTFILES/.zshenv.vmlserver02
fi
