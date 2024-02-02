export PATH=$PATH:~/.local/bin:~/.config/composer/vendor/bin
export DOTFILES=$HOME/code/dotfiles

if [ -z "$SSH_AUTH_SOCK" ] ; then
	  eval `ssh-agent -s`
	    ssh-add
fi

# Windows Powerline Setup.
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi

# Get nvm loaded
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Include aliases
source $DOTFILES/bash/.aliases

# Colorize and Upgrade Basic Commands
alias ls="ls -CF --color=auto"
alias ll="ls -lash"
alias l.="ls -d .* --color=auto"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Specific aliases and setup for your job.
if [ -f $DOTFILES/bash/.jobspecific ]; then
    source $DOTFILES/bash/.jobspecific
fi
