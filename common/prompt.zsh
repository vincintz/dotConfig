setopt prompt_subst

# Prompt indicator if user is elevated as admin
usr_prompt() {
    id -G | grep -qE '\<(114|544)\>' &> /dev/null
    if [ $? -eq 0 ]; then
        echo '%F{yellow}#%f'
    else
        echo '%#'
    fi
}
git_info() {
    local gitbranch="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    local gitstatus="$(git status 2> /dev/null)"
    if [ -n "$gitbranch" ]; then
        local branch_color='white'
        if echo ${gitstatus} | grep -c "branch is ahead"  &> /dev/null; then branch_color='green'; fi
        if echo ${gitstatus} | grep -c "renamed"  &> /dev/null; then branch_color='yellow'; fi
        if echo ${gitstatus} | grep -c "new file"  &> /dev/null; then branch_color='yellow'; fi
        if echo ${gitstatus} | grep -c "Untracked files"  &> /dev/null; then branch_color='yellow'; fi
        if echo ${gitstatus} | grep -c "modified"  &> /dev/null; then branch_color='yellow'; fi
        if echo ${gitstatus} | grep -c "deleted"  &> /dev/null; then branch_color='yellow'; fi
        if echo ${gitstatus} | grep -c "have diverged"  &> /dev/null; then branch_color='yellow'; fi
        echo "[%F{$branch_color}$gitbranch%f] "
    fi
}

if [[ $OSTYPE == "cygwin" ]]; then
    PROMPT='%F{white}%~%f $(git_info)$(usr_prompt) '
elif [[ $OSTYPE == "linux-gnu" ]]; then
    PROMPT='%F{white}%n@%m:%~%f $(git_info)%# '
else
    PROMPT='%F{white}%~%f $(git_info)%# '
fi

