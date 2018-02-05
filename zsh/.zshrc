####################################################################################
# Env vars
####################################################################################

export DOTFILES="${HOME}/.dotfiles"
export DEFAULT_USER="$USER"
export TERM="xterm-256color"

ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc ${DOTFILES}/**/*.zsh)

# theme customization
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_SHORTEN_DELIMITER='…'
POWERLEVEL9K_STATUS_VERBOSE=false


####################################################################################
# ZSH configuration
####################################################################################

# list all of our zsh files
typeset -U config_files
config_files=($DOTFILES/**/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}; do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}; do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}; do
  source $file
done

unset config_files

####################################################################################
# Zgen
####################################################################################

# load zgen
source "${DOTFILES}/vendor/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
	echo 'Creating zgen init script'

    # oh my zsh
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/aws
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/encode64
    zgen oh-my-zsh plugins/git-extras
	zgen oh-my-zsh plugins/httpie
	zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/wd

    zgen load ${DOTFILES}/zsh/oh-my-zsh-plugins/iterm2-tab-color
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load bhilburn/powerlevel9k powerlevel9k

	# save init script
	zgen save
fi

####################################################################################
# NVM
####################################################################################
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

####################################################################################
# ZSH Hooks
####################################################################################
eval "$(direnv hook zsh)"
