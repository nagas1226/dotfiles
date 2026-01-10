eval "$(sheldon source)"      # zsh plugins
eval "$(zoxide init zsh)"     # z command
eval "$(starship init zsh)"   # terminal prompt settings

# fzf - fuzzy finder (Ctrl+R: history, Ctrl+T: files, Alt+C: cd)
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'


# alias
alias ls='eza'
alias ll='eza -lF'
alias la='eza -lAF'
alias tree='eza -T'
alias ai='claude'
alias vim='nvim'
alias brewup='brew bundle dump --file=~/.Brewfile --force'

# change the config path of lazy git  to `~/.config/lazygit/config.yml`
if command -v lazygit &> /dev/null; then
  declare -x LG_CONFIG_FILE=~/.config/lazygit/config.yml
  export LG_CONFIG_FILE

  # lg で lazygit を開く
  function lg(){
    lazygit "$@"
  }
fi



