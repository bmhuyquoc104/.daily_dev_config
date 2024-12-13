# Path configuration
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH=$PATH:/Applications/Firefox.app/Contents/MacOS
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completionexport OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export BAT_THEME="Catppuccin Mocha"

# Set up default working environment
export EDITOR=/opt/homebrew/bin/nvim

# Alias
alias pzf='nvim $(fzf -m --preview "bat --style=numbers --color=always {}")'
alias help='tldr'

# Fzf configuration
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
source <(fzf --zsh)
# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
fzf-cmd-and-run-widget() {
  fzf-history-widget
  zle accept-line
}
zle     -N   fzf-cmd-and-run-widget
bindkey '^R' fzf-cmd-and-run-widget


fzf-cd-and-run-widget() {
  fzf-cd-widget
  zle accept-line
}
zle     -N   fzf-cd-and-run-widget
bindkey '^T' fzf-cd-and-run-widget

# CLI configuration
eval "$(zoxide init zsh)"
eval $(thefuck --alias fuck)
eval "$(rbenv init - zsh)"
eval "$(starship init zsh)"


# Load Zsh plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

