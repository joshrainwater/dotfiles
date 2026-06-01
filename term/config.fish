# ~/.config/fish/config.fish

# ─── Environment Detection ────────────────────────────────────────────────────

set -l uname_r (uname -r)
set -l uname_s (uname -s)

if string match -qi '*microsoft*' $uname_r
    set -g IS_WSL true
else
    set -g IS_WSL false
end

if test $uname_s = Linux
    set -g IS_LINUX true
else
    set -g IS_LINUX false
end

# ─── PATH ─────────────────────────────────────────────────────────────────────

fish_add_path ~/.local/bin
fish_add_path ~/.config/composer/vendor/bin
fish_add_path /usr/local/go/bin
fish_add_path ~/go/bin
fish_add_path ~/.opencode/bin

# ─── Environment Variables ────────────────────────────────────────────────────

set -gx DOTFILES $HOME/dotfiles

# ─── Prompt (non-WSL) ─────────────────────────────────────────────────────────
# Uses starship if available; falls back to fish default.
# Install: curl -sS https://starship.rs/install.sh | sh

if not $IS_WSL
    if command -sq starship
        starship init fish | source
    end
end

# ─── WSL: Powerline ───────────────────────────────────────────────────────────
# Fish doesn't support the bash powerline binding, so we skip it here.
# If you want a powerline-style prompt in WSL, install starship there too.

# ─── Zoxide ───────────────────────────────────────────────────────────────────

if command -sq zoxide
    zoxide init fish | source
end

# ─── NVM ──────────────────────────────────────────────────────────────────────
# Fish requires the nvm.fish plugin instead of the bash nvm script.
# Install: fisher install jorgebucaran/nvm.fish
# Then use: nvm install lts  /  nvm use lts

# ─── Directory Jumping ────────────────────────────────────────────────────────

alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias cd.. 'cd ..'

# ─── Core Utils ───────────────────────────────────────────────────────────────

if $IS_WSL
    alias ls 'ls -CF --color=auto'
    alias ll 'ls -lash'
    alias l. 'ls -d .* --color=auto'
else
    # Native Linux — use the good stuff if available
    if command -sq eza
        alias ls 'eza --icons'
        alias ll 'eza -l --icons --git'
        alias l. 'eza -d .* --icons'
    else
        alias ls 'ls -CF --color=auto'
        alias ll 'ls -lash'
        alias l. 'ls -d .* --color=auto'
    end

    if command -sq bat
        alias cat bat
    end
end

alias grep 'grep --color=auto'
alias egrep 'egrep --color=auto'
alias fgrep 'fgrep --color=auto'

# ─── Docker ───────────────────────────────────────────────────────────────────

alias d docker
alias dp 'docker ps -a'
alias di 'docker images'
alias dc docker-compose
alias up 'docker-compose up -d'
alias down 'docker-compose down'

# ─── Editor ───────────────────────────────────────────────────────────────────

alias vi nvim
alias n 'nvim .'

# ─── Go ───────────────────────────────────────────────────────────────────────

alias g 'go run .'
alias air '~/go/bin/air'
alias got 'go test ./...'
alias gotv 'go test ./... -v'
alias w 'wails dev'

# ─── Source Job-specific config ───────────────────────────────────────────────
# Create $DOTFILES/fish/job.fish for work-specific stuff (not committed)

if test -f $DOTFILES/fish/job.fish
    source $DOTFILES/fish/job.fish
end
