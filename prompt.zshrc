setopt prompt_subst

autoload -Uz vcs_info
zstyle ':vcs_info:*'    enable git
zstyle ':vcs_info:*'    check-for-changes true
zstyle ':vcs_info:*'    unstagedstr   '%{%F{red}%B%}●%{%b%f%}'
zstyle ':vcs_info:*'    stagedstr     '%{%F{yellow}%B%}●%{%b%f%}'
zstyle ':vcs_info:git*' actionformats '%b:%a'
zstyle ':vcs_info:git*' formats       '%b %u%c'
precmd () { vcs_info }

usr_prompt() {
   if [[ $(uname -o) -eq "Cygwin" ]]; then
      id -G | grep -qE '\<(114|544)\>' &> /dev/null
      if [ $? -eq 0 ]; then
         echo '%F{magenta}#%f'
      else
         echo '%#'
      fi
   else
      echo '%#'
   fi
}

PROMPT='%F{yellow}%* %~%f $(usr_prompt) '
RPROMPT='${vcs_info_msg_0_}'
