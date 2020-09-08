function fco() {
  git checkout $(git branch -a | tr -d " " | fzf --height 100% --preview "git log --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g")
}
zle -N fco
bindkey '^B' fco

function fhist() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}
zle -N fhist
bindkey '^H' fhist

function fkill() {
  local pid
  if [ "$UID" -eq "0" ]; then
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "$pid" != "" ]; then
    echo $pid | xargs kill -${1:-9}
  fi
}
zle -N fkill
bindkey '^K' fkill
