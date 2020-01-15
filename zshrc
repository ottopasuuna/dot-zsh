autoload -Uz compinit promptinit colors run-help, zmv
compinit
promptinit
colors

autoload -U zargs

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' use-cache 1
#don't know what this does
zstyle ':completion:*' completer _expand _complete _ignored _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

unsetopt CASE_GLOB
unset GREP_OPTIONS
setopt COMPLETE_ALIASES
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt GLOB_COMPLETE
setopt emacs #expected readline behaivior
setopt EXTENDED_GLOB

#Dissable flow control so we can use crtl q/s
stty -ixon -ixoff

unsetopt complete_aliases
SHELL_CONFIG_DIR=$HOME/.config/shell

source ~/.zplugin/bin/zplugin.zsh
zplugin light zdharma/fast-syntax-highlighting
# zplugin load "zsh-users/zsh-syntax-highloading"
zplugin load zsh-users/zsh-completions
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zplugin load "esc/conda-zsh-completion"
zplugin load "supercrabtree/k"
zplugin light "MichaelAquilina/zsh-you-should-use"
zplugin load "arzzen/calc.plugin.zsh"

zplugin load olivierverdier/zsh-git-prompt
zplugin snippet OMZ::plugins/pyenv/pyenv.plugin.zsh
zplugin load ~/Programming/Shell/manor
zplugin ice multisrc"*.sh"
zplugin load $SHELL_CONFIG_DIR

autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

source ~/.zsh-theme/gnzh.zsh-theme

bindkey -s "^h" "cd ..\n"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/carl/.local/share/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

