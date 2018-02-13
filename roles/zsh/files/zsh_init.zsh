# Configure colors in terminal
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"

# Configure history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY # Add history
setopt EXTENDED_HISTORY # Add timestamps to history
setopt HIST_IGNORE_ALL_DUPS # Don't record dupes in history
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY SHARE_HISTORY # Add history incrementally and share it across sessions
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# Add aliases
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias gh='history | grep'
alias h='history'
alias ls='ls -Fhp'
alias ll='ls -aFhlp'
alias reload='source ~/.zshrc'
alias sudo='sudo ' # Enable aliases to be sudo’ed

# Don't expand aliases _before_ completion has finished
setopt complete_aliases

# Make vi the default editor
export EDITOR='vi'

# Add function to update the environment
function update() {
  typeset -U files
  files=(~/.zsh/*_update.zsh)
  for file in ${(M)files}; do
    source $file
  done
  unset files
}
