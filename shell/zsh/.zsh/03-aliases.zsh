# ============================================================================
# ALIASES - Command shortcuts and convenience aliases
# ============================================================================

# ----------------------------------------------------------------------------
# ls aliases
# ----------------------------------------------------------------------------
alias ls='ls -GFh'              # Colorized, classified, human-readable
alias lh='ls -d .*'             # Show hidden files/directories only
alias lsd='ls -aFhlG'           # Long listing with all files
alias l='ls -al'                # All files, long format
alias ll='ls -GFhl'             # Long listing

# ----------------------------------------------------------------------------
# Grep aliases (with colors)
# ----------------------------------------------------------------------------
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# ----------------------------------------------------------------------------
# General shortcuts
# ----------------------------------------------------------------------------
alias c='clear'
alias ssh="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5000"
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias dus='du -sckx * | sort -nr'  # Directories sorted by size

# ----------------------------------------------------------------------------
# Git aliases (additional to oh-my-zsh git plugin)
# ----------------------------------------------------------------------------
# The git plugin already provides: gst, gco, gaa, gcmsg, gp, gl, etc.
# Add your custom git aliases here if needed
