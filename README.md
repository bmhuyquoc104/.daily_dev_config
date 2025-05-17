This repository contains my personal configuration for using neovim in ghostty with fish shell along with various clis tools and default apps. Please follow the instructions below to use it properly.

## Prerequisites

1. Install Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Fish shell:
```bash
brew install fish
```

3. Install Navi (interactive cheatsheet tool):
```bash
brew install navi
```

## Installation

You have two options for installation:

### Option 1: Interactive Installation using Navi

1. Run `navi` in your terminal
2. Browse and select the installation scripts you want to execute
3. Press Tab to execute multiple selected scripts

### Option 2: Manual Installation

You can choose to install components individually by running the specific installation scripts directly from the repository.

## Neovim Setup

Before using the Neovim configuration:

1. Ensure npm is properly installed via mise
2. Install Neovim:
```bash
mise use node@latest
```
3. Open Neovim and wait for the automatic plugin installation to complete
## Tmux Setup

After installing the configuration:

1. Open `tmux.conf`
2. Press `Ctrl + s` followed by `I` to install all plugins
3. For Catppuccin theme configuration, follow the instructions at [catppuccin/tmux](https://github.com/catppuccin/tmux)
4. For tmux session x issue when open, follow this [issue](https://github.com/omerxx/tmux-sessionx/issues/166) to fix 
