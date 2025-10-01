# ============================================================================
# ENVIRONMENT - PATH, exports, and system detection
# ============================================================================

# ----------------------------------------------------------------------------
# System Detection (fast - uses builtins)
# ----------------------------------------------------------------------------
case "$(uname)" in
    Linux*)  IS_LINUX=1 ;;
    Darwin*) IS_MAC=1   ;;
esac

# Command detection (zsh builtin hash table lookup)
(( $+commands[brew] )) && HAS_BREW=1

# ----------------------------------------------------------------------------
# PATH Configuration
# ----------------------------------------------------------------------------
typeset -U path  # Automatically remove duplicates

# Core system paths
path=(
  /opt/homebrew/bin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  $path
)

# User-specific paths (only if they exist)
[[ -d "$HOME/bin" ]] && path=("$HOME/bin" $path)
[[ -d /usr/local/go/bin ]] && path=(/usr/local/go/bin $path)
[[ -d /usr/local/m-cli ]] && path=($path /usr/local/m-cli)
[[ -d "/Applications/MacVim.app/Contents/bin" ]] && path=("/Applications/MacVim.app/Contents/bin" $path)

# Google Cloud SDK (only if installed)
if [[ -d "$HOME/Downloads/google-cloud-sdk/bin" ]]; then
  path=($path "$HOME/Downloads/google-cloud-sdk/bin")
fi

export PATH

# ----------------------------------------------------------------------------
# Node Version Manager (fnm - fast!)
# ----------------------------------------------------------------------------
if command -v fnm &> /dev/null; then
  eval "$(fnm env --use-on-cd)"
fi

# Lazy-load nvm if you prefer it over fnm (uncomment these lines):
# export NVM_DIR="$HOME/.nvm"
# alias nvm='unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; nvm $@'
# alias node='unalias node; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; node $@'
# alias npm='unalias npm; [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; npm $@'

# ----------------------------------------------------------------------------
# Terminal and Colors
# ----------------------------------------------------------------------------
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS=exfxcxdxbxegedabagacad

# Grep colors (use aliases instead of deprecated GREP_OPTIONS)
export GREP_COLOR='3;33'

# ----------------------------------------------------------------------------
# Architecture and Build Flags
# ----------------------------------------------------------------------------
if [[ "$IS_MAC" == "1" ]]; then
  # Auto-detect architecture (arm64 for Apple Silicon, x86_64 for Intel)
  export ARCHFLAGS="-arch $(uname -m)"
fi

# ----------------------------------------------------------------------------
# Editor and Pager
# ----------------------------------------------------------------------------
export EDITOR='mvim -f'
export PAGER='less'
export LESS='--ignore-case --raw-control-chars'

# ----------------------------------------------------------------------------
# Docker Completions Path
# ----------------------------------------------------------------------------
fpath=(~/.docker/completions $fpath)
