#!/bin/bash
input=$(cat)

# ---- extract fields ----
MODEL=$(echo "$input" | jq -r '.model.display_name // "Claude"')
DIR=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""' | sed "s|^$HOME|~|")
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
COST=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
DURATION_MS=$(echo "$input" | jq -r '.cost.total_duration_ms // 0')

# ---- colors ----
CYAN='\033[38;5;117m'
PURPLE='\033[38;5;147m'
GRAY='\033[38;5;249m'
GIT_GREEN='\033[38;5;150m'
YELLOW='\033[33m'
GREEN='\033[32m'
RED='\033[31m'
RST='\033[0m'

# ---- git ----
GIT_PART=""
if git rev-parse --git-dir >/dev/null 2>&1; then
  BRANCH=$(git branch --show-current 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  STAGED=$(git diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
  MODIFIED=$(git diff --numstat 2>/dev/null | wc -l | tr -d ' ')
  GIT_STATUS=""
  [ "$STAGED" -gt 0 ] && GIT_STATUS="${GREEN}+${STAGED}${RST}"
  [ "$MODIFIED" -gt 0 ] && GIT_STATUS="${GIT_STATUS}${YELLOW}~${MODIFIED}${RST}"
  GIT_PART="  🌿 ${GIT_GREEN}${BRANCH}${RST}${GIT_STATUS:+ $GIT_STATUS}"
fi

# ---- context bar ----
PCT=${PCT:-0}
if [ "$PCT" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

FILLED=$((PCT / 10)); EMPTY=$((10 - FILLED))
BAR=$(printf "%${FILLED}s" | tr ' ' '█')$(printf "%${EMPTY}s" | tr ' ' '░')

# ---- duration ----
MINS=$((DURATION_MS / 60000))
SECS=$(((DURATION_MS % 60000) / 1000))

# ---- output ----
printf "📁 ${CYAN}${DIR##*/}${RST}${GIT_PART}  🤖 ${PURPLE}${MODEL}${RST}\n"
printf "${BAR_COLOR}${BAR}${RST} ${PCT}%%  💰 ${YELLOW}\$$(printf '%.4f' "$COST")${RST}  ⏱️  ${MINS}m ${SECS}s\n"
