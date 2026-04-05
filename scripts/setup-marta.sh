#!/bin/bash
# Setup Marta file manager configuration symlinks

set -e

MARTA_DIR="$HOME/Library/Application Support/org.yanex.marta"
DOTFILES_MARTA_DIR="$HOME/dotfiles/.config/marta"

echo "Setting up Marta configuration..."

# Create Marta config directory if it doesn't exist
mkdir -p "$MARTA_DIR"

# Backup existing configs if they exist and are not symlinks
for file in conf.marco favorites.marco; do
    target="$MARTA_DIR/$file"
    if [[ -f "$target" && ! -L "$target" ]]; then
        echo "Backing up existing $file to $file.bak"
        mv "$target" "$target.bak"
    fi
done

# Create symlinks
ln -sf "$DOTFILES_MARTA_DIR/conf.marco" "$MARTA_DIR/conf.marco"
ln -sf "$DOTFILES_MARTA_DIR/favorites.marco" "$MARTA_DIR/favorites.marco"

echo "Marta configuration linked successfully!"
echo "  $MARTA_DIR/conf.marco -> $DOTFILES_MARTA_DIR/conf.marco"
echo "  $MARTA_DIR/favorites.marco -> $DOTFILES_MARTA_DIR/favorites.marco"
