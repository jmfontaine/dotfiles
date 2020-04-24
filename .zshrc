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
alias tf="terraform"
alias tfa="terraform apply"
alias tfi="terraform init"
alias tfp="terraform plan"
alias sudo='sudo ' # Enables aliases to be sudo’ed

# Configure colors in terminal
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"

# Configure history
HISTFILE=~/.zsh_history
HISTORY_IGNORE="(cd|cd -|cd ..|exit|ls|pwd)"
HISTSIZE=100000
SAVEHIST=100000

setopt EXTENDED_HISTORY # Add timestamps to history
setopt HIST_EXPIRE_DUPS_FIRST # Remove duplicates first when trimming history
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
