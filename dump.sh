#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Saving VSCode extensions..."
code --list-extensions > "${BASEDIR}/editors/vs-code/extensions"

echo "Saving brew..."
brew bundle dump --file="${BASEDIR}/brew/Brewfile" --force
