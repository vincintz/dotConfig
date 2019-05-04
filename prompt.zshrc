setopt prompt_subst

# Prompt indicator if user is elevated as admin
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
git_info() {
   local gitbranch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
   if [ -n "$gitbranch" ]; then
      if [ -n "$(git status --porcelain 2> /dev/null)" ]; then
         echo "%F{magenta}($gitbranch)%f "
      else
         echo "%F{cyan}($gitbranch)%f "
      fi
   fi
}
PROMPT='%F{yellow}%* %~%f $(git_info)$(usr_prompt) '

# autoload -Uz vcs_info
# zstyle ':vcs_info:*'    enable git
# zstyle ':vcs_info:*'    check-for-changes true
# zstyle ':vcs_info:*'    unstagedstr   '%{%F{red}%B%}●%{%b%f%}'
# zstyle ':vcs_info:*'    stagedstr     '%{%F{yellow}%B%}●%{%b%f%}'
# zstyle ':vcs_info:git*' actionformats '%b:%a'
# zstyle ':vcs_info:git*' formats       '%b %u%c'
# precmd () { vcs_info }
# PROMPT='%F{yellow}%* %~%f $(usr_prompt) '
# RPROMPT='${vcs_info_msg_0_}'
