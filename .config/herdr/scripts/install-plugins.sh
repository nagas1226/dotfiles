#!/bin/sh

set -eu

herdr_bin=${HERDR_BIN_PATH:-herdr}

# Install the exact source revisions pinned by this dotfiles setup.
"$herdr_bin" plugin install cedrus-8864/herdr-prompt-reply \
  --ref e34e7d0040d910dac0218745462a7e0e4cc66f1b \
  --yes

"$herdr_bin" plugin install qu8n/herdr-automatic-rename \
  --ref 11cbee3aa54ea3a507550e4f58a2727de2b119eb \
  --yes

"$herdr_bin" plugin install zackshen/herdr-workspace \
  --ref b5f38d0e295168fcd87284b710049a183140f010 \
  --yes

"$herdr_bin" plugin install yoshiori/herdr-configurable-picker \
  --ref 9b53d836f226d51efc81a70185db08028bd574c1 \
  --yes

"$herdr_bin" plugin install persiyanov/herdr-reviewr \
  --ref 4fc80835699e293f0608c243028f8513557d7c77 \
  --yes
