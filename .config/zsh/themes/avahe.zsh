# ZSH Theme from Avahe Kellenberger
git_branch() {
    if out="$(git -C . rev-parse > /dev/null 2>&1)"; then 
        printf " $%s$(git branch | pcregrep -o1 "\*[\s]*(.*)")"
    fi
}

set_prompt() {
    branch="$(git_branch)"
    NEWLINE=$'\n'
    PROMPT="${NEWLINE}%F{white}┌[%f%F{blue}%~%f%F{white}]%f${NEWLINE}%F{white}└[%f%F{green}%n%f%F{yellow}@%f%F{blue}%m%f%F{red}%}${branch}%F{white}]$%f "
}

precmd_functions+=(set_prompt)
set_prompt
