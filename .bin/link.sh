#!/bin/bash

# 現在のスクリプトのディレクトリを取得
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 除外したいパターンをリスト化
EXCLUDE_PATTERNS=(".git" ".github" ".DS_Store")

# すべてのドットファイルをループ
for dotfile in "${SCRIPT_DIR}/".??*; do
    # 除外パターンにマッチするファイルをスキップ
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
        [[ "$(basename "$dotfile")" == "$pattern" ]] && continue 2
    done
    
    # シンボリックリンクを作成
    ln -fnsv "$dotfile" "$HOME"
done
