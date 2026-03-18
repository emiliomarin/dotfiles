# Configuration
# --------------------------------------
[ -f "$HOME/.zsh/config/options.zsh" ] && source "$HOME/.zsh/config/options.zsh"
[ -f "$HOME/.zsh/config/completions.zsh" ] && source "$HOME/.zsh/config/completions.zsh"
[ -f "$HOME/.zsh/config/variables.zsh" ] && source "$HOME/.zsh/config/variables.zsh"
[ -f "$HOME/.zsh/config/aliases.zsh" ] && source "$HOME/.zsh/config/aliases.zsh"
[ -f "$HOME/.zsh/config/bindings.zsh" ] && source "$HOME/.zsh/config/bindings.zsh"
[ -f "$HOME/.zsh/config/hooks.zsh" ] && source "$HOME/.zsh/config/hooks.zsh"

# Explicit machine configuration
# --------------------------------------
[ -f "$HOME/.envrc" ] && source "$HOME/.envrc"

# Oh-My-Zsh
# --------------------------------------
export ZSH="$HOME/.oh-my-zsh"
plugins=(git golang zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# Starship (after oh-my-zsh)
# --------------------------------------
eval "$(starship init zsh)"

# Node version manager (fnm - faster than nvm)
# --------------------------------------
eval "$(fnm env --use-on-cd --shell zsh)"

# Go configuration
# --------------------------------------
export GOPRIVATE=github.com/SWORDHealth/*
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Google Cloud SDK
# --------------------------------------
export CLOUDSDK_PYTHON=python3
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# Opencode
# --------------------------------------
export OPENCODE_CONFIG="$HOME/.config/opencode/opencode.json"
export OPENCODE_CONFIG_DIR="$HOME/.config/opencode"

# PATH configuration
# --------------------------------------
export BUN_INSTALL="$HOME/.bun"
export PATH="/usr/local/opt/python@3.12/bin:$PATH"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.config/opencode/bin:$PATH"
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

# Deduplicate PATH entries
typeset -U path

export GPG_TTY=$(tty)
