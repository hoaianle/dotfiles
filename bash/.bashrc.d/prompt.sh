parse_git_branch() {
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || return
    local current_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [[ -n "$(git status --porcelain)" ]]; then
        echo "($current_branch *)"
    else
        echo "($current_branch)"
    fi
}

PS1=''
PS1+='\[\033[01;32m\]\u'
PS1+='\[\033[00m\]@'
PS1+='\[\033[01;32m\]\h'
PS1+='\[\033[00m\]:'
PS1+='\[\033[01;34m\]\w'
PS1+='\[\033[01;93m\]$(parse_git_branch)'
PS1+='\[\033[00m\]\$ '
