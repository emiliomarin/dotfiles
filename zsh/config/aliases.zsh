alias zshconfig="code ~/.zshrc"

alias c='clear'
alias h='history'

alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"

alias ll='ls -la'
alias tree='lsd --tree'

# Utils
alias k='kill -9'

# Github
alias ghw="gh browse"
alias ga="git add ."
alias gtmp='git commit -m "tmp"'
alias grebase='git rebase -i HEAD~2'
alias gpf='git push --force'
alias gpc='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gm='git checkout main'

# Go
alias gotest='go test -v -failfast ./...'
alias golint='golangci-lint run'

# Kubernetes
alias k="kubectl"
