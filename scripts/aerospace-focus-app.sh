#!/bin/zsh

set -eu

app_bundle_id="${1:?app bundle ID is required}"
aerospace_bin="/opt/homebrew/bin/aerospace"
window_ids=()

while IFS='|' read -r detected_bundle_id window_id; do
  if [[ "$detected_bundle_id" == "$app_bundle_id" ]]; then
    window_ids+=("$window_id")
  fi
done < <($aerospace_bin list-windows --all \
  --format '%{app-bundle-id}|%{window-id}')

if (( ${#window_ids[@]} == 0 )); then
  /usr/bin/open -b "$app_bundle_id"
  exit
fi

focused_window_id="$($aerospace_bin list-windows --focused \
  --format '%{window-id}' 2>/dev/null || true)"
target_index=1

for (( index = 1; index <= ${#window_ids[@]}; index++ )); do
  if [[ "${window_ids[$index]}" == "$focused_window_id" ]]; then
    target_index=$((index % ${#window_ids[@]} + 1))
    break
  fi
done

$aerospace_bin focus --window-id "${window_ids[$target_index]}"
