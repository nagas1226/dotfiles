# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
~/dotfiles/
├── zsh/                    # Zsh shell configuration
├── .config/
│   ├── ghostty/            # Terminal emulator
│   ├── nvim/               # Neovim editor (LazyVim)
│   ├── lazygit/            # Git terminal UI
│   ├── sheldon/            # Zsh plugin manager
│   └── starship/           # Shell prompt
├── .gitconfig              # Git configuration
├── .gitignore_global       # Global gitignore patterns
└── .Brewfile               # Homebrew packages list
```

## New Machine Setup

```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Clone this repo
git clone git@github.com:YOUR_USERNAME/dotfiles.git ~/dotfiles

# Install packages and link
cd ~/dotfiles
brew bundle --file=.Brewfile
stow .
sheldon lock
```

## Commands

```bash
stow .              # Link all dotfiles
stow -D .           # Unlink all
stow -R .           # Re-stow (useful after adding new configs)
sheldon lock        # Download/update zsh plugins
brewup              # Update .Brewfile with installed packages
brew bundle         # Install packages from .Brewfile
```

## Adding New Configs

1. Create directory: `mkdir -p ~/dotfiles/.config/newapp`
2. Add config files
3. Re-stow: `stow -R .`
