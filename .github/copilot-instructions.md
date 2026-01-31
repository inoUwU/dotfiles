# Copilot Instructions for dotfiles

## Repository Overview

This is a personal dotfiles repository containing configuration files for development environment setup across Linux, macOS, Windows, and NixOS. The primary configurations are:

- **Neovim** (`nvim/`) - Main editor configuration with Lazy.nvim plugin manager
- **NixOS** (`nixos/`) - Nix flake-based system configuration
- **Terminal emulators** - Alacritty (`alacritty.toml`), Ghostty (`ghostty/`)
- **Shell/tooling** - tmux (`.tmux.conf`), Starship prompt (`starship.toml`), lazygit (`lazygit/`)

## Architecture

### Neovim Configuration

**Structure:**
- `nvim/init.lua` - Entry point, sets up leader key (Space), handles VSCode integration, loads colorscheme with persistence
- `nvim/lua/base.lua` - Core Vim settings, OS-specific shell configuration (Nu shell on Windows, zsh on macOS, bash on Linux)
- `nvim/lua/lazy_nvim.lua` - Plugin manager setup with conditional plugin loading for VSCode
- `nvim/lua/lsp.lua` - LSP keybindings and diagnostic configuration
- `nvim/lua/plugins/` - Plugin configurations organized by category:
  - `ai/` - AI assistant plugins
  - `debug/` - Debugging tools
  - `colorscheme/` - Color schemes
  - `lsp/` - Language server configurations
  - `lang/` - Language-specific plugins
  - `editor/` - General editor enhancements

**Plugin Management:**
- Uses Lazy.nvim (lockfile: `lazy-lock.json`)
- Plugins conditionally loaded based on VSCode detection (`vim.g.vscode`)
- Disabled default plugins: gzip, matchit, matchparen, netrw, tar, tohtml, tutor, zip

**Key Conventions:**
- Leader key: Space
- LSP keybindings use `<leader>l` prefix (e.g., `<leader>ld` for declaration, `<leader>lr` for rename)
- Uses `last-color` plugin to persist colorscheme selection (defaults to "yoda" theme)
- Special filetype detection for GitHub Actions YAML files (`.github/workflows/*.{yml,yaml}`)
- Clipboard integrated with system clipboard (`clipboard = "unnamedplus"`)

### NixOS Configuration

**Structure:**
- `nixos/flake.nix` - Main flake with inputs (nixpkgs, home-manager, niri, noctalia, vicinae)
- `nixos/configuration.nix` - System-level configuration importing hardware and host configs
- `nixos/home.nix` - User-level home-manager configuration
- `nixos/host/` - Host-specific configurations
- `nixos/hw/` - Hardware-specific configurations
- `nixos/apps/` - Application configurations
- `nixos/rice/` - Desktop environment/theming configurations

**Key Conventions:**
- Uses flakes with `nix-command` experimental feature
- Home-manager integrated at system level with backup extension ".bak"
- Allows unfree packages by default
- System state version: 24.11

## Installation Scripts

### Linux/macOS: `setup.sh`

Creates symlinks for:
- `nvim/` → `~/.config/nvim`
- `starship.toml` → `~/.config/starship.toml`
- `ghostty/` → `~/.config/ghostty`

Automatically backs up existing files with timestamp suffix.

### NixOS: `nixlink.sh`

Alternative setup script for NixOS environments.

### Windows: `nvim_link_win.bat`

Links Neovim configuration to Windows AppData location.

## Formatting/Linting

**Neovim Lua:**
- Uses StyLua with configuration in `nvim/stylua.toml`
- Settings: 2-space indentation, 120 character column width

## Development Notes

- **Bilingual documentation**: README includes both Japanese and English
- **Cross-platform considerations**: Different shell configurations per OS (see `nvim/lua/base.lua`)
- **NixOS rebuilds**: Use `sudo nixos-rebuild switch --flake .#nixos` from `nixos/` directory
- **Lazy.nvim**: Plugin updates disabled by default (`checker.enabled = false`)
- **Manual linking required** for tmux, vim, Alacritty, and lazygit configs (not handled by setup scripts)
