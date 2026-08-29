#!/bin/sh

set -eu

# Codex's shared app-server can start this MCP server outside the terminal
# pane that launched Codex. In that case, recover the focused Herdr pane so
# File Annotator can still open its review beside the active Codex agent.
if [ "${HERDR_ENV:-}" != "1" ]; then
  pane_json=$(herdr pane current)
  pane_id=$(printf '%s' "$pane_json" | jq -r '.result.pane.pane_id // empty')
  workspace_id=$(printf '%s' "$pane_json" | jq -r '.result.pane.workspace_id // empty')

  if [ -z "$pane_id" ] || [ -z "$workspace_id" ]; then
    echo "annotator: could not find the focused Herdr pane" >&2
    exit 1
  fi

  export HERDR_ENV=1
  export HERDR_PANE_ID="$pane_id"
  export HERDR_WORKSPACE_ID="$workspace_id"
  export HERDR_SOCKET_PATH="${HERDR_SOCKET_PATH:-$HOME/.config/herdr/herdr.sock}"
fi

plugin_json=$(herdr plugin list --plugin jonasbaeumer.file-annotator --json)
plugin_root=$(printf '%s' "$plugin_json" | jq -r '.result.plugins[0].plugin_root // empty')

if [ -z "$plugin_root" ]; then
  echo "annotator: Herdr File Annotator plugin is not installed" >&2
  exit 1
fi

exec "$plugin_root/bin/herdr-annotator" mcp
