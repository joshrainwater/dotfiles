[ -z "$PS1" ] && return

# Windows Powerline Setup.
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi

# Zoxide setup script
eval "$(zoxide init bash)"

# Set DOTFILES and PATH (for non-login interactive shells)
export PATH=$PATH:~/.local/bin:~/.config/composer/vendor/bin:/usr/local/go/bin:$HOME/go/bin
export DOTFILES=$HOME/dotfiles

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# opencode
export PATH=/home/josh/.opencode/bin:$PATH

# Source aliases
if [ -f $DOTFILES/bash/.aliases ]; then
    source $DOTFILES/bash/.aliases
fi

# Source job-specific aliases
if [ -f $DOTFILES/bash/.jobspecific ]; then
    source $DOTFILES/bash/.jobspecific
fi

# Colorize and upgrade basic commands
# alias cd="z"
alias ls="ls -CF --color=auto"
alias ll="ls -lash"
alias l.="ls -d .* --color=auto"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# dircolors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# bash-completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
