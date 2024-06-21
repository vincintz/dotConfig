[[ -s $HOME/.bashrc ]] && source $HOME/.bashrc

# Node Version Manager (nvm)
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"          ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# other bash complete
[ -x "$(command -v minikube)"   ] && eval "$(minikube completion bash)"
[ -x "$(command -v kubectl)"    ] && eval "$(kubectl completion bash)"
[ -x "$(command -v poetry)"     ] && eval "$(poetry completions bash)"
[ -x "$(command -v starship)"   ] && eval "$(starship init bash)"
[ -x "$(command -v zoxide)"     ] && eval "$(zoxide init bash)"
[ -x "$(command -v fzf)"        ] && source /usr/share/doc/fzf/examples/key-bindings.bash

export NVM_DIR
