# ============================================================================
# OPTIONS - Shell behavior and history settings
# ============================================================================

# ----------------------------------------------------------------------------
# History Configuration
# ----------------------------------------------------------------------------
HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zsh_history

# ----------------------------------------------------------------------------
# General Options
# ----------------------------------------------------------------------------
setopt no_beep                   # Don't beep on error
setopt interactive_comments      # Allow comments in interactive shells

# ----------------------------------------------------------------------------
# Directory Navigation
# ----------------------------------------------------------------------------
setopt auto_cd                   # Type directory name to cd into it
setopt pushd_ignore_dups         # Don't push duplicate directories

# ----------------------------------------------------------------------------
# Globbing and Expansion
# ----------------------------------------------------------------------------
setopt extended_glob             # Use extended globbing syntax

# ----------------------------------------------------------------------------
# History Options
# ----------------------------------------------------------------------------
setopt append_history            # Append to history file
setopt extended_history          # Save timestamp and duration
setopt inc_append_history        # Add commands as they are typed
setopt hist_expire_dups_first    # Expire duplicates first
setopt hist_ignore_dups          # Don't record duplicates
setopt hist_ignore_space         # Ignore commands starting with space
setopt hist_find_no_dups         # Don't show duplicates in search
setopt hist_reduce_blanks        # Remove extra blanks
setopt hist_verify               # Show command before executing from history
setopt share_history             # Share history between sessions

# ----------------------------------------------------------------------------
# Completion Options
# ----------------------------------------------------------------------------
setopt always_to_end             # Move cursor to end after completion
setopt auto_menu                 # Show completion menu on tab
setopt auto_name_dirs            # Auto-name directories
setopt complete_in_word          # Complete from middle of word
unsetopt menu_complete           # Don't autoselect first entry

# ----------------------------------------------------------------------------
# Correction Options
# ----------------------------------------------------------------------------
setopt correct                   # Correct spelling of commands only
# Note: correctall removed - it was too annoying!

# ----------------------------------------------------------------------------
# Prompt Options
# ----------------------------------------------------------------------------
setopt prompt_subst              # Enable parameter expansion in prompt

# ----------------------------------------------------------------------------
# Other Options
# ----------------------------------------------------------------------------
setopt multios                   # Implicit tees and cats with redirections
