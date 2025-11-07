if status is-interactive
  # Path configuration
  fish_add_path /opt/homebrew/bin
  fish_add_path (go env GOPATH)/bin
  fish_add_path /opt/homebrew/opt/curl/bin
  fish_add_path /opt/homebrew/opt/mysql@8.0/bin
  fish_add_path $HOME/.local/bin
  fish_add_path /opt/homebrew/opt/libpq/bin

  # Environment variables
  set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
  set -gx BAT_THEME "Catppuccin Mocha"
  set -gx EDITOR /opt/homebrew/bin/nvim

  # Commands to run in interactive sessions can go here
  zoxide init fish | source
  starship init fish | source
  mise activate fish | source

  # Aliases
  alias pzf='nvim (fzf -m --preview "bat --style=numbers --color=always {}")'
  alias activate='source .venv/bin/activate.fish'
  alias poetry_activate='eval (poetry env activate)'
  alias help='tldr'

  # FZF configuration
  set -gx FZF_DEFAULT_OPTS "\
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  --color=selected-bg:#45475a \
  --multi"

  # fish_config theme save "Catppuccin Mocha"

  bind -e --preset \cs

  #Fish settings
  fish_vi_key_bindings
  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_replace_one underscore
  set fish_cursor_replace underscore
  set fish_cursor_external line

  # key bindings
  bind -e --preset \cs
  bind -M insert \cf pager-toggle-search
  bind -M default \cf pager-toggle-search
end
