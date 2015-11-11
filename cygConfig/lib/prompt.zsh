# Setup VCS info
setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats ' [%b:%a]'
zstyle ':vcs_info:*' formats       ' [%b]'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b:%r'
zstyle ':vcs_info:*' enable git cvs
precmd () { vcs_info }


# Set up the prompt
autoload -Uz promptinit && promptinit
PS1='%F{white}%* %~${vcs_info_msg_0_} %# %f'
