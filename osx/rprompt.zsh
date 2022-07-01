function preexec() {
  timer=$(($(gdate +%s%0N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(gdate +%s%0N)/1000000))
    elapsed=$(($now-$timer))
    export RPROMPT="%F{cyan}${elapsed}ms %{$reset_color%}"
    unset timer
  fi
}
