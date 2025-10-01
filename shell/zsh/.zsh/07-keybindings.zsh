# ============================================================================
# KEYBINDINGS - Keyboard shortcuts
# ============================================================================
# To see the key combo you want to use: cat > /dev/null (then press the key)
# ============================================================================

bindkey "^K"      kill-whole-line                      # Ctrl+K
bindkey "^R"      history-incremental-search-backward  # Ctrl+R
bindkey "^A"      beginning-of-line                    # Ctrl+A
bindkey "^E"      end-of-line                          # Ctrl+E
bindkey "[B"      history-search-forward               # Down arrow
bindkey "[A"      history-search-backward              # Up arrow
bindkey "^D"      delete-char                          # Ctrl+D
bindkey "^F"      forward-char                         # Ctrl+F
bindkey "^B"      backward-char                        # Ctrl+B

# Uncomment for vi mode instead of emacs mode
# bindkey -v
