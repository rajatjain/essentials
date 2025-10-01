# ============================================================================
# PLUGINS - Zinit plugin management
# ============================================================================

# ----------------------------------------------------------------------------
# Essential Plugins
# ----------------------------------------------------------------------------

# Syntax highlighting (colors valid/invalid commands)
zinit light zsh-users/zsh-syntax-highlighting

# Autosuggestions (gray text from history)
zinit light zsh-users/zsh-autosuggestions

# Git aliases (gst, gco, gaa, gcmsg, etc.)
zinit snippet OMZP::git

# ----------------------------------------------------------------------------
# Autosuggestions Configuration
# ----------------------------------------------------------------------------
# Accept suggestion with Ctrl+Space or Right Arrow
bindkey '^ ' autosuggest-accept
bindkey '^[[C' forward-char

# Change suggestion color (adjust as needed)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# ----------------------------------------------------------------------------
# Optional: Additional Plugins (commented out by default)
# ----------------------------------------------------------------------------

# Docker completions (uncomment to enable)
# zinit ice as"completion"
# zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

# Docker Compose completions (uncomment to enable)
# zinit ice as"completion"
# zinit snippet https://github.com/docker/compose/blob/main/contrib/completion/zsh/_docker-compose

# Kubectl completions (uncomment to enable)
# zinit ice as"completion"
# zinit snippet OMZP::kubectl

# AWS CLI completions (uncomment to enable)
# zinit ice as"completion"
# zinit snippet OMZP::aws

# Terraform completions (uncomment to enable)
# zinit ice as"completion"
# zinit snippet OMZP::terraform
