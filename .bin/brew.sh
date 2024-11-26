#!/bin/bash

# macOS確認
if [ "$(uname)" != "Darwin" ]; then
    echo "Not macOS!"
    exit 1
fi

# スクリプトのディレクトリに移動
cd "$(dirname "$0")"

# Homebrewのバンドル実行
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install it first."
    exit 1
fi

brew bundle --global
