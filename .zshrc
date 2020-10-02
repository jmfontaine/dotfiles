export EDITOR='vi'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias cask="brew cask"
alias c='code .'
alias g="git"
alias gh='history | grep'
alias h='history'
alias ls='ls -F'
alias ll='ls -aFhl'
alias t="open -a Typora ."
alias tf="terraform"
alias tfa="terraform apply"
alias tfi="terraform init"
alias tfp="terraform plan"
alias sudo='sudo ' # Enables aliases to be sudo’ed

export CLICOLOR=1 # Enable colors in terminal

# Configure history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt EXTENDED_HISTORY # Add timestamps to history
setopt HIST_IGNORE_SPACE # Ignore when the first character on the line is a space
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks
setopt HIST_VERIFY # Do not execute command from history directly
setopt INC_APPEND_HISTORY # Add incrementally to the history file

# Configure completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit

  setopt AUTO_MENU
  zstyle ':completion:*' menu yes select
fi

# Configure zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug MichaelAquilina/zsh-you-should-use
zplug zdharma/fast-syntax-highlighting
zplug mfaerevaag/wd, as:command, use:"wd.sh", hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#677A83,bg=#000000"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="(cd *|exit|ls *|pwd|youtube-dl *|.|..*|* --help|* --version)"
zplug zsh-users/zsh-autosuggestions

zplug mafredri/zsh-async, from:github # Pure dependency
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zstyle :prompt:pure:git:stash show yes

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

path=(
    /usr/local/opt/coreutils/libexec/gnubin
    /usr/local/opt/gnu-sed/libexec/gnubin
    /usr/local/opt/gzip/bin
    /usr/local/opt/python@3.8/libexec/bin
    $path
)

# Configure nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

