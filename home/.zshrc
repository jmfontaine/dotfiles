# Path to your oh-my-zsh installation.
export ZSH=$HOME/Tools/oh-my-zsh

fpath=( "$HOME/.zfunctions" $fpath )

# Set name of the theme to load.
# Look in$HOME/Tools/oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in $HOME/Tools/oh-my-zsh/plugins/*)
plugins=(brew composer git npm osx symfony2 vagrant)

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles
# * ~/.zsh-path can be used to extend `$PATH`.
# * ~/.zsh-extra can be used for other settings you don’t want to commit to your repo.
for file in ~/.zsh-{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Prompt
autoload -U promptinit && promptinit
prompt pure

# ZSH Syntax Highlighting
# WARNING: This must be at the end of this file
source $HOME/Tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
