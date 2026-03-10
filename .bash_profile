export PATH=$PATH:~/.local/bin:~/.config/composer/vendor/bin:/usr/local/go/bin
export DOTFILES=$HOME/dotfiles

if [ -z "$SSH_AUTH_SOCK" ] ; then
	  eval `ssh-agent -s`
	    ssh-add
fi

# Source .bashrc for interactive shells
if [ -f $DOTFILES/bash/.bashrc ]; then
    source $DOTFILES/bash/.bashrc
fi
