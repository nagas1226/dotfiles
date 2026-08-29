export STARSHIP_CONFIG=~/.config/starship/config.toml

# default terminal
export EDITOR='nvim'
export VISUAL='nvim'

# Claude Code: enable built-in LSP tool (v2.0.74+ on by default; explicit
# for older builds and for documentation).
export ENABLE_LSP_TOOL=1

. "$HOME/.cargo/env"
