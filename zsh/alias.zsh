alias grep='grep --color=auto'
alias myip="curl https://ifconfig.me; echo"
alias ncdu="ncdu --color=dark"
alias mysql="mysql --pager='pspg -X -F' --safe-updates --select-limit=500"
alias gco="git rev-parse --is-inside-work-tree > /dev/null && git branch --format='%(refname:short)' --sort=-committerdate | fzf --header 'Select branch' --preview 'git diff {1} --color=always' | xargs git checkout"
