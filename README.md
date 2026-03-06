# Dotfiles

Automated setup for a full development environment on Ubuntu/WSL.

## What's Included

- **Terminal**: Ghostty (terminal emulator), Neovim (editor), zoxide (cd replacement), fzf (fuzzy finder)
- **Languages**: PHP 8.4, Node.js (via nvm), Typescript, Go 1.26
- **Tools**: GitHub CLI, AWS CLI, Docker, lazygit, ripgrep, fd-find
- **Apps**: Obsidian, Antigravity, OpenCode

## Quick Start

```bash
cp .env.local.example .env.local
# Edit .env.local with your settings
./install
```

## Optional Installers

Set these in `.env.local` before running `./install`:

| Variable | Description |
|----------|-------------|
| `INSTALL_PHP` | PHP 8.4, Composer, Laravel installer, PHP Actor, PHP CS Fixer |
| `INSTALL_JAVASCRIPT` | Node.js via nvm, TypeScript, TypeScript Language Server |
| `INSTALL_GO` | Go 1.26, Air (live reload), Wails |
| `INSTALL_DOCKER` | Docker Engine, Docker Compose |
| `INSTALL_APPS` | Desktop apps (Obsidian, Antigravity, Ghostty, OpenCode) |

## Usage

```bash
# Run full setup
./install

# Or source individual installers
./installers/ubuntu-setup.sh
./installers/php.sh
# etc.
```

## Shell Aliases

- `ll` / `ls` - colorized listing
- `vi` / `n` - Neovim
- `d` / `dc` / `up` / `down` - Docker shortcuts
- `a` - PHP Artisan
- `sail` - Laravel Sail
- `t` - Run TypeScript with ts-node
- `air` - Go live reload
- `w` - Wails dev

---

## Windows / WSL Setup

If running on Windows with WSL:

- Install a NerdFont for icons (JetBrains or FiraCode): https://www.nerdfonts.com/font-downloads
- Install Windows Terminal
- Remove default margins in Windows Terminal settings
