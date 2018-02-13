# Manage zplug with zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Pure Prompt
zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme

# ZSH Configuration
zplug '~/.zsh', use:'*_init.zsh', from:local

# Misc. packages
zplug 'mfaerevaag/wd', as:command, use:wd.sh, hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"
zplug 'MichaelAquilina/zsh-you-should-use'
zplug 'zdharma/fast-syntax-highlighting'
