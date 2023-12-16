### zsh path (must be first)
path=(
    $(brew --prefix)/opt/coreutils/libexec/gnubin # use GNU commands instead of MacOS ones
    $path
)

###############################################################################
# Commands                                                                    #
###############################################################################

### Antidote
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  # lazy-load antidote and generate the static load file only when needed
  (
    source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

### bat
alias -g -- -h="-h 2>&1 | bat --language=help --plain" # colorize --help messages
alias -g -- --help="--help 2>&1 | bat --language=help --plain"
export MANPAGER="sh -c 'col -bx | bat --language man --plain'" # colorize man pages

### eza
eval $(dircolors -b $HOME/.DIR_COLORS)

### fzf
source ~/.fzf.zsh
source ~/.fzf_functions.zsh

### Starship
eval "$(starship init zsh)"

### zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#677A83,bg=#000000"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="(cd *|exit|ls *|pwd|.|..*|* --help|* --version)"


###############################################################################
# zsh                                                                         #
###############################################################################

### Aliases
alias history="fc -l 1" # remove the 16-item limitation

### Completion
unsetopt LIST_BEEP # don't beep on an ambiguous completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit

  setopt AUTO_MENU
  setopt AUTO_PARAM_SLASH
  zstyle ':completion:*' menu yes select

  if [[ -v LS_COLORS ]]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
  fi

  # Shift-Tab: Perform menu completion, like menu-complete, except that if a menu
  # completion is already in progress, move to the previous completion rather than
  # the next.
  # See http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Completion.
  [ -n "${terminfo[kcbt]}" ] && bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi
source $(brew --prefix)/opt/git-extras/share/git-extras/git-extras-completion.zsh

### Functions

# update packages
function update {
  echo -e "\033[1m────────── Homebrew ──────────\033[0m"
  brew bundle --all --cleanup --global --quiet
  brew upgrade
  brew autoremove --quiet
  echo ""
  echo "\033[1m────────── App Store ──────────\033[0m"
  mas upgrade
  echo ""
  echo "\033[1m────────── Antidote ──────────\033[0m"
  source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
  antidote update --bundles
  echo ""
}

### History
export HISTFILE=~/.zsh_history # set history file path
export HISTFILESIZE=1000000000 # set history file max size
export HISTSIZE=1000000000 # set history max size
setopt EXTENDED_HISTORY # record the timestamp of each command
setopt HIST_FIND_NO_DUPS # ignore dupilcates when searching history
setopt HIST_IGNORE_SPACE # ignore commands that start with space
setopt HIST_VERIFY # show command with history expansion to user before running it
setopt SHARE_HISTORY # share history with other sessions
