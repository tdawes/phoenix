function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

setopt PROMPT_SUBST
export PROMPT='%F{cyan}%n:%F{yellow}%~%F{245}$(parse_git_branch)%F{white}%%%f '

# zsh autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# git aliases
alias gs="git status"
alias gl="git lola"
alias gd="git diff"
alias gdc="git diff --cached"

export PATH="${${(%):-%x}:a:h}/unix:$PATH"

eval "$(direnv hook zsh)"