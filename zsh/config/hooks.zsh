# place default node version under $HOME/.node-version
load-fnmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]] || [[ -f .node-version && -r .node-version ]]; then
    fnm use
  fi
}

add-zsh-hook chpwd load-fnmrc
