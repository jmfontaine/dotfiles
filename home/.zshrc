# Path to your oh-my-zsh installation.
export ZSH=$HOME/Tools/oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Set name of the theme to load.
ZSH_THEME="jmf"

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in $HOME/Tools/oh-my-zsh/plugins/*)
plugins=(brew composer docker git iterm2-tab-color npm osx symfony2 vagrant)

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles
# * ~/.zsh-path can be used to extend `$PATH`.
# * ~/.zsh-extra can be used for other settings you don’t want to commit to your repo.
for file in ~/.zsh-{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

# SSH host autocompletion
if [ -f ~/.ssh/config ]; then
	HOSTS=`grep -E '^Host\s+=?\s+([^*]*?)$' ~/.ssh/config | sed 's/=//g' | awk '{print $2}'`
fi
if [ "$hosts" ]; then
	zstyle ':completion:*:hosts' hosts $HOSTS
fi

# AWS CLI Completion
source /usr/local/share/zsh/site-functions/_aws

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# ZSH Syntax Highlighting
# WARNING: This must be at the end of this file
source $HOME/Tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
