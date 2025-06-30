# Global variables
# --------------------------------------
export path=(
  "$HOME/bin"
  "$PATH:$(go env GOPATH)/bin"
  "/opt/homebrew/bin"
  "/usr/local/bin"
  "/usr/local/sbin"
  "/bin"
  "/usr/bin"
  "/usr/sbin"
  "/sbin"
)

# User config directory
export XDG_CONFIG_HOME="$HOME/Library/Application\ Support"

export KUBECONFIG="$HOME/.kube/config"

# Terminal config
export WORDCHARS='*?_[]~=&;!#$%^(){}'

# History limits
export HISTFILE=$HOME/.zhistory
export HISTSIZE=1000000
export SAVEHIST=1000000

# Utilities
export PAGER='less'
export DELTA_PAGER='less -R'
export EDITOR='vim'
export GIT_EDITOR='vim'
export BROWSER='open'
export LESS="-+e -+f -R -+c -X -M -S -r"

# Locales
export LANG="en_US.UTF-8"
export LC_ALL=$LANG

# Go
export GOPATH="$HOME/go"
export GOBIN=$HOME/go/bin
export GOPROXY="https://goproxy.io"
