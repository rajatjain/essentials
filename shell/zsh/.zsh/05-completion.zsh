# ============================================================================
# COMPLETION - Tab completion configuration
# ============================================================================

# ----------------------------------------------------------------------------
# Initialize completion system (optimized)
# ----------------------------------------------------------------------------
autoload -Uz compinit

# Speed up compinit by checking cache only once per day
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Load completion menu module
zmodload -i zsh/complist

# ----------------------------------------------------------------------------
# Completion caching
# ----------------------------------------------------------------------------
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# ----------------------------------------------------------------------------
# Completion menu behavior
# ----------------------------------------------------------------------------
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# ----------------------------------------------------------------------------
# Completion matching
# ----------------------------------------------------------------------------
# Case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# List of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# ----------------------------------------------------------------------------
# Completion formatting
# ----------------------------------------------------------------------------
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# ----------------------------------------------------------------------------
# Colors in completion
# ----------------------------------------------------------------------------
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# ----------------------------------------------------------------------------
# SSH/SCP completion
# ----------------------------------------------------------------------------
zstyle ':completion:*:scp:*' tag-order files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr

# ----------------------------------------------------------------------------
# Misc completion settings
# ----------------------------------------------------------------------------
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle '*' single-ignored show
