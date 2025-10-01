# ============================================================================
# ZSHRC - Main Configuration File
# ============================================================================
# Optimized for speed: ~0.1s startup time
# Load order: env → options → plugins → completion → prompt → keybindings
# ============================================================================

# ----------------------------------------------------------------------------
# ZINIT PLUGIN MANAGER SETUP
# ----------------------------------------------------------------------------
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# ----------------------------------------------------------------------------
# LOAD CONFIGURATION FILES IN ORDER
# ----------------------------------------------------------------------------
source ~/.zsh/00-env.zsh          # Environment variables, PATH
source ~/.zsh/01-options.zsh      # Shell options and history
source ~/.zsh/02-plugins.zsh      # Zinit plugins (git, autosuggestions, etc)
source ~/.zsh/03-aliases.zsh      # Command aliases
source ~/.zsh/04-functions.zsh    # Helper functions
source ~/.zsh/05-completion.zsh   # Tab completion settings
source ~/.zsh/06-prompt.zsh       # Prompt configuration
source ~/.zsh/07-keybindings.zsh  # Keyboard shortcuts

# ----------------------------------------------------------------------------
# TERMINAL-SPECIFIC INTEGRATIONS
# ----------------------------------------------------------------------------
# Kiro terminal integration
[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# IntelliJ terminal integration
if [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]]; then
  autoload -Uz compinit && compinit
fi

# ============================================================================
# INSTALLATION NOTES
# ============================================================================
# First time setup:
# 1. Install fnm: brew install fnm
# 2. Install Node: fnm install --lts
# 3. Reload shell: source ~/.zshrc
# 4. Test speed: time zsh -i -c exit (should be ~0.1s)
# ============================================================================
