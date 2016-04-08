# Configure colors in terminal
export CLICOLOR=1
export LSCOLORS="exfxcxdxbxegedabagacad"

# Configure history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_VERIFY
setopt EXTENDED_HISTORY # add timestamps to history
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"


# Don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

# Make vi the default editor
export EDITOR="vi"
