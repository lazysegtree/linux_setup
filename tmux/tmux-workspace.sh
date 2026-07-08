#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
  printf "Usage: %s <dir>\n" "$0" >&2
  exit 1
fi

if [ ! -d "$1" ]; then
  printf "Not a directory: %s\n" "$1" >&2
  exit 1
fi

PROJECT_DIR="$(cd -- "$1" && pwd)"
SESSION_NAME="$(basename "$PROJECT_DIR")"

if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
  tmux new-session -d -s "$SESSION_NAME" -n editor -c "$PROJECT_DIR"
  tmux send-keys -t "$SESSION_NAME:editor" "nvim ." C-m

  tmux new-window -d -t "$SESSION_NAME:" -n codex -c "$PROJECT_DIR"
  tmux send-keys -t "$SESSION_NAME:codex" "codex" C-m

  tmux new-window -d -t "$SESSION_NAME:" -n shell -c "$PROJECT_DIR"
  tmux select-window -t "$SESSION_NAME:editor"
fi

if [ -n "${TMUX:-}" ]; then
  tmux switch-client -t "$SESSION_NAME"
  exit 0
fi

if [ -t 1 ]; then
  tmux attach-session -t "$SESSION_NAME"
  exit 0
fi

printf "Created tmux session '%s'. Attach with: tmux attach -t %s\n" "$SESSION_NAME" "$SESSION_NAME"
