# This theme was heavily inspired by agnoster's Theme (https://gist.github.com/3712874)
# and Pure prompt (https://github.com/sindresorhus/pure)

## The following variables can be used to tweak the prompt
CMD_MAX_EXEC_TIME=3

#############################################
# Segment drawing                           #
#############################################
CURRENT_BG='NONE'
SEGMENT_SEPARATOR='⮀'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted, rendering default background/foreground.
draw_prompt_segment() {
    local bg fg
    [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
    [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
    if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
        echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
    else
        echo -n "%{$bg%}%{$fg%} "
    fi
    CURRENT_BG=$1
    [[ -n $3 ]] && echo -n $3
}
 
# End the prompt, closing any open segments
draw_prompt_end() {
    if [[ -n $CURRENT_BG ]]; then
        echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
    else
        echo -n "%{%k%}"
    fi
    echo -n "%{%f%}"
    CURRENT_BG=''
}

#############################################
# Segments                                  #
#############################################

# Displays user and host when in a SSH connection
draw_prompt_ssh() {
    if [[ -n "$SSH_CLIENT" ]]; then
        draw_prompt_segment black default "%(!.%{%F{yellow}%}.)%n@%m"
    fi
}

# Displays Git info when inside a repository
draw_prompt_git() {
    local ref dirty
    if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
        ZSH_THEME_GIT_PROMPT_DIRTY='±'
        dirty=$(parse_git_dirty)
        ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
        if [[ -n $dirty ]]; then
            draw_prompt_segment yellow black
        else
            draw_prompt_segment green black
        fi
        echo -n "${ref/refs\/heads\//⭠ }$dirty"
    fi
}

# Displays path current to current directory
draw_prompt_dir() {
    draw_prompt_segment blue black '%2~'
}
 
# Displays exit status if different from 0
draw_prompt_exit_status() {
    if [[ $RETVAL -ne 0 ]] then;
        draw_prompt_segment red black "%{%F{white}%}✘ %?"
    fi
}

#############################################
# Utility functions                         #
#############################################

# Define start_time variable to avoid some errors
start_time=$SECONDS
prompt_jmf_preexec() {
    start_time=$SECONDS
}

prompt_jmf_precmd() {
    setopt LOCAL_OPTIONS
    unsetopt XTRACE KSH_ARRAYS

    timer_result=$(($SECONDS-$start_time))
    if [[ $timer_result -gt $CMD_MAX_EXEC_TIME ]]; then
        display_elapsed_time
    fi
    start_time=$SECONDS
}

display_elapsed_time() {
    if [[ $timer_result -ge 3600 ]]; then
        let "timer_hours = $timer_result / 3600"
        let "remainder = $timer_result % 3600"
        let "timer_minutes = $remainder / 60"
        let "timer_seconds = $remainder % 60"
        print -P "%B%F{red}» elapsed time: ${timer_hours}h${timer_minutes}m${timer_seconds}s%b"
    elif [[ $timer_result -ge 60 ]]; then
        let "timer_minutes = $timer_result / 60"
        let "timer_seconds = $timer_result % 60"
        print -P "%B%F{yellow}» elapsed time: ${timer_minutes}m${timer_seconds}s%b"
    else;
        print -P "%B%F{green}» elapsed time: ${timer_result}s%b"
    fi
}

#############################################
# Main functions                            #
#############################################

# Build prompts
build_prompt() {
    RETVAL=$?

    draw_prompt_ssh
    draw_prompt_dir
    draw_prompt_git
    draw_prompt_exit_status
    draw_prompt_end
}

# Set prompt up
prompt_jmf_setup() {
    setopt LOCAL_OPTIONS
    unsetopt XTRACE KSH_ARRAYS
    prompt_opts=(cr percent subst)

    autoload -Uz add-zsh-hook

    add-zsh-hook preexec prompt_jmf_preexec
    add-zsh-hook precmd prompt_jmf_precmd

    PROMPT='%{%f%b%k%}$(build_prompt) '
}
 
prompt_jmf_setup "$@"
