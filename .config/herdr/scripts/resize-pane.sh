#!/bin/sh

set -eu

mode=${1:-}
pane_id=${HERDR_ACTIVE_PANE_ID:-}
herdr_bin=${HERDR_BIN_PATH:-herdr}

case "$mode" in
  grow) amount=0.05 ;;
  shrink) amount=0.05 ;;
  *)
    echo "usage: resize-pane.sh grow|shrink" >&2
    exit 2
    ;;
esac

if [ -z "$pane_id" ]; then
  echo "HERDR_ACTIVE_PANE_ID is not set" >&2
  exit 1
fi

edges=$("$herdr_bin" pane edges --pane "$pane_id")
direction=$(printf '%s\n' "$edges" | jq -r '
  .result.edges |
  if .right == false then "right"
  elif .left == false then "left"
  elif .down == false then "down"
  elif .up == false then "up"
  else ""
  end
')

# A tab with only one pane has no divider to resize.
if [ -z "$direction" ]; then
  exit 0
fi

# Herdr 0.8 treats the amount as a positive magnitude. Shrinking therefore
# moves the same divider in the opposite direction.
if [ "$mode" = "shrink" ]; then
  case "$direction" in
    right) direction=left ;;
    left) direction=right ;;
    down) direction=up ;;
    up) direction=down ;;
  esac
fi

"$herdr_bin" pane resize \
  --pane "$pane_id" \
  --direction "$direction" \
  --amount "$amount" \
  >/dev/null
