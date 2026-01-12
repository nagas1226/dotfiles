# Dotfiles Repository

Personal dotfiles managed with GNU Stow.

## Structure

```
~/dotfiles/
├── zsh/                    # Zsh shell configuration
├── .config/                # XDG config directory
│   ├── ghostty/            # Terminal emulator
│   ├── nvim/               # Neovim editor
│   ├── wezterm/            # Terminal emulator
│   ├── lazygit/            # Git terminal UI
│   ├── sheldon/            # Zsh plugin manager
│   ├── starship/           # Shell prompt
│   ├── gh/                 # GitHub CLI
│   ├── raycast/            # Productivity launcher (macOS)
├── .gitconfig              # Git configuration
├── .gitignore_global       # Global gitignore patterns
└── .Brewfile               # Homebrew packages list
```

## Commands

```bash
stow .              # Link all dotfiles
stow -D .           # Unlink all
stow zsh            # Link only zsh package
sheldon lock        # Download/update zsh plugins
brewup              # Update .Brewfile with installed packages
brew bundle         # Install packages from .Brewfile
```

## Adding New Configs

1. Create directory: `mkdir -p ~/dotfiles/.config/newapp`
2. Re-stow: `stow -R .`

## New Machine Setup

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone dotfiles
git clone git@github.com:USERNAME/dotfiles.git ~/dotfiles

# Install packages and link
cd ~/dotfiles
brew bundle --file=.Brewfile
stow .
sheldon lock
```
