# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh' 
alias lh='ls -d .*' # show hidden files/directories only
alias lsd='ls -aFhlG'
alias l='ls -al'
alias ll='ls -GFhl' # Same as above, but in long listing format

alias c='clear'
alias ssh="ssh -o TCPKeepAlive=yes -o ServerAliveInterval=5000"                    

alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias 'dus=du -sckx * | sort -nr' #directories sorted by size

