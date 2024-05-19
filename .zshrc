export LANG=en_US.UTF-8

export PATH="$HOME/go/bin:/opt/homebrew/bin:/opt/homebrew/opt/openjdk/bin:$PATH"

# use eza instead of ls (https://github.com/eza-community/eza)
alias ls='eza'
alias ll='eza -l'
alias la="eza -la"
# use bat instead of cat (https://github.com/sharkdp/bat)
alias cat="bat"
# use rigrep instead of grep (https://github.com/BurntSushi/ripgrep)
alias grep="rg"
# use fd instead of find (https://github.com/sharkdp/fd)
alias find="fd"

alias astronvim='NVIM_APPNAME=astronvim nvim'
alias joseannvim='NWIM_APP_NAME=joseannvim nvim'
alias tmux='tmux new-session -A -s default'

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
#source ~/.zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
