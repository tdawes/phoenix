function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

setopt PROMPT_SUBST
export PROMPT='%F{cyan}%n:%F{yellow}%~%F{245}$(parse_git_branch)%F{white}%%%f '

# zsh autocompletion
autoload -Uz compinit && compinit

# git aliases
alias gs="git status"
alias gl="git lola"

export PATH="${${(%):-%x}:a:h}/unix:$PATH"