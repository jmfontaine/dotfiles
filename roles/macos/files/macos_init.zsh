# Add GNU utilities to $PATH
path=(/usr/local/opt/coreutils/libexec/gnubin $path)
path=(/usr/local/opt/findutils/libexec/gnubin $path)

# Add GNU utilities to $MANPATH
manpath=(/usr/local/opt/findutils/libexec/gnuman $manpath)
manpath=(/usr/local/opt/coreutils/libexec/gnuman $manpath)
typeset -U manpath
export MANPATH # For some reason MANPATH must be exported while PATH does not need to
