#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

SHELL_CONFIG_DIR=$HOME/.config/shell
if ls $SHELL_CONFIG_DIR/*.sh >/dev/null 2>&1 ; then
    for f in $SHELL_CONFIG_DIR/*.sh; do source $f; done
fi
if ls $SHELL_CONFIG_DIR/*.bash >/dev/null 2>&1 ; then
    for f in $SHELL_CONFIG_DIR/*.bash; do source $f; done
fi

PS1='[\u@\h \W]\$ '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/carl/.local/share/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/carl/.local/share/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/carl/.local/share/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/carl/.local/share/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.bash
