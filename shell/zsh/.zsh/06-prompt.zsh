# ============================================================================
# PROMPT - Clean, minimal prompt with git status
# ============================================================================

# ----------------------------------------------------------------------------
# Enable colors
# ----------------------------------------------------------------------------
autoload -U colors && colors

# ----------------------------------------------------------------------------
# Python virtualenv
# ----------------------------------------------------------------------------
virtualenv_info() {
  [[ -n "$VIRTUAL_ENV" ]] && echo "%{$fg[green]%}($(basename $VIRTUAL_ENV))%{$reset_color%}"
}

# ----------------------------------------------------------------------------
# Ruby version (updates on directory change only)
# ----------------------------------------------------------------------------
typeset -g _prompt_ruby_version=""

_update_ruby_version() {
  typeset -g _prompt_ruby_version=''
  
  if (( $+commands[rbenv] )); then
    _prompt_ruby_version="$(rbenv version-name 2>/dev/null)"
  elif (( $+commands[rvm-prompt] )); then
    _prompt_ruby_version="$(rvm-prompt i v g 2>/dev/null)"
  fi
}

chpwd_functions+=(_update_ruby_version)
_update_ruby_version  # Initialize at startup

ruby_version_info() {
  [[ -n "$_prompt_ruby_version" ]] && echo "%{$fg[red]%}(${_prompt_ruby_version})%{$reset_color%}"
}

# ----------------------------------------------------------------------------
# Git status
# ----------------------------------------------------------------------------

git_info() {
  # Check if in git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return
  
  # Get branch name
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
  
  # Build status indicators
  local indicators=""
  
  # Modified files (unstaged)
  ! git diff --quiet 2> /dev/null && indicators+="%{$fg[yellow]%}d%{$reset_color%}"
  
  # Staged files
  ! git diff --cached --quiet 2> /dev/null && indicators+="%{$fg[green]%}s%{$reset_color%}"
  
  # Untracked files
  [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]] && indicators+="%{$fg[red]%}u%{$reset_color%}"
  
  # Get ahead/behind
  local ahead=$(git rev-list @{upstream}..HEAD 2>/dev/null | wc -l | tr -d ' ')
  local behind=$(git rev-list HEAD..@{upstream} 2>/dev/null | wc -l | tr -d ' ')
  
  [[ $ahead -gt 0 ]] && indicators+=" %{$fg[red]%}↑${ahead}%{$reset_color%}"
  [[ $behind -gt 0 ]] && indicators+=" %{$fg[cyan]%}↓${behind}%{$reset_color%}"
  
  # Build output with brackets
  echo "[%{$fg[blue]%}${branch}%{$reset_color%} ${indicators}] "
}

# ----------------------------------------------------------------------------
# Current directory (shortened)
# ----------------------------------------------------------------------------
current_dir() {
  echo "%{$fg[yellow]%}${PWD/#$HOME/~}%{$reset_color%}"
}

# Enable prompt substitution
setopt prompt_subst

# ----------------------------------------------------------------------------
# Prompt definition
# ----------------------------------------------------------------------------

PROMPT='$(git_info)$(current_dir) $(virtualenv_info)$(ruby_version_info)
%{$fg[cyan]%}➜%{$reset_color%}  '

# No right prompt
RPROMPT=''

# Spelling correction prompt
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color [(y)es (n)o (a)bort (e)dit]? "
