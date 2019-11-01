setopt prompt_subst

# Prompt indicator if user is elevated as admin
usr_prompt() {
    id -G | grep -qE '\<(114|544)\>' &> /dev/null
    if [ $? -eq 0 ]; then
        echo '%F{magenta}#%f'
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
if [[ $OSTYPE == "cygwin" ]]; then
    PROMPT='%F{yellow}%~%f $(git_info)$(usr_prompt) '
    RPROMPT='%F{blue}[%*]'
else
    PROMPT='%F{yellow}%~%f $(git_info)%# '
    RPROMPT='%F{blue}%m [%*]'
fi
