#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Saving VSCode extensions..."
code --list-extensions > "${BASEDIR}/editors/vs-code/extensions"

echo "Saving brew..."
brew bundle dump --file="${BASEDIR}/brew/Brewfile" --force

echo "Saving Cursor user settings..."
if [ -f "$HOME/Library/Application Support/Cursor/User/settings.json" ]; then
  cp "$HOME/Library/Application Support/Cursor/User/settings.json" "${BASEDIR}/editors/vs-code/settings.json"
fi

echo "Saving Cursor keybindings..."
if [ -f "$HOME/Library/Application Support/Cursor/User/keybindings.json" ]; then
  cp "$HOME/Library/Application Support/Cursor/User/keybindings.json" "${BASEDIR}/editors/vs-code/keybindings.json"
fi

echo "Saving Cursor user rules..."
mkdir -p "${BASEDIR}/cursor/rules"
if [ -d "$HOME/.cursor/rules" ]; then
  rsync -a --delete "$HOME/.cursor/rules/" "${BASEDIR}/cursor/rules/"
fi

echo "Saving Claude Code config (non-secret)..."
mkdir -p "${BASEDIR}/claude"
if [ -f "$HOME/.claude/CLAUDE.md" ]; then
  cp "$HOME/.claude/CLAUDE.md" "${BASEDIR}/claude/CLAUDE.md"
fi
if [ -f "$HOME/.claude/settings.json" ]; then
  cp "$HOME/.claude/settings.json" "${BASEDIR}/claude/settings.json"
fi
