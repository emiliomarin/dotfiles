# Configuration
# --------------------------------------
source $HOME/.zsh/config/options.zsh
source $HOME/.zsh/config/completions.zsh
source $HOME/.zsh/config/variables.zsh
source $HOME/.zsh/config/aliases.zsh
source $HOME/.zsh/config/bindings.zsh
source $HOME/.zsh/config/syntax-highlighting.zsh
source $HOME/.zsh/config/suggestions.zsh
source $HOME/.zsh/config/hooks.zsh

# Explicit machine configuration
# --------------------------------------
source $HOME/.envrc

# zsh modules autoloading
# --------------------------------------
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -a zsh/mapfile mapfile

# Starship
eval "$(starship init zsh)"

export ZSH="/Users/emilio/.oh-my-zsh"
plugins=(git golang zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
