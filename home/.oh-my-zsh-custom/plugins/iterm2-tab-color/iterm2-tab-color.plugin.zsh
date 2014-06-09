# Based on https://github.com/wadey/dotfiles/blob/master/zsh/iterm2.zsh
# http://code.google.com/p/iterm2/wiki/ProprietaryEscapeCodes

if [[ -n "$ITERM_SESSION_ID" ]]; then
    tab-color() {
        echo -ne "\033]6;1;bg;red;brightness;$1\a"
        echo -ne "\033]6;1;bg;green;brightness;$2\a"
        echo -ne "\033]6;1;bg;blue;brightness;$3\a"
    }
    tab-red() { tab-color 252 42 28 }
    tab-blue() { tab-color 58 155 219 }
    tab-reset() { echo -ne "\033]6;1;bg;*;default\a" }

    function iterm2_precmd() {
        tab-reset
    }

    function iterm2_preexec() {
        if [[ "$1" =~ "^ssh " ]]; then
            if [[ "$1" =~ "dev-" ]]; then
                tab-blue
            else
                tab-red
            fi
        fi
    }

    autoload -U add-zsh-hook
    add-zsh-hook precmd  iterm2_precmd
    add-zsh-hook preexec iterm2_preexec
fi