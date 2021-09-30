if [[ -f "$HOME/.zinit/bin/zmodules/Src" ]]; then
    module_path+=( "$HOME/.zinit/bin/zmodules/Src" )
    zmodload zdharma/zplugin
fi
autoload -Uz compinit promptinit colors run-help, zmv
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
setopt CORRECT

#Dissable flow control so we can use crtl q/s
stty -ixon -ixoff

unsetopt complete_aliases
SHELL_CONFIG_DIR=$HOME/.config/shell

source ~/.zinit/bin/zinit.zsh
zinit ice wait lucid
zinit light zdharma/fast-syntax-highlighting
# zinit load "zsh-users/zsh-syntax-highloading"
zinit load zsh-users/zsh-completions
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit load "esc/conda-zsh-completion"
zinit load "supercrabtree/k"
zinit ice wait lucid
zinit light "MichaelAquilina/zsh-you-should-use"
zinit load "arzzen/calc.plugin.zsh"
zinit load "racket/shell-completion"

# Currently giving an error message
# zinit ice pick"shell/exercism_completion.zsh"
# zinit load "exercism/cli"

zinit load olivierverdier/zsh-git-prompt
zinit snippet OMZ::plugins/pyenv/pyenv.plugin.zsh
zinit load ~/Programming/Shell/manor
zinit ice multisrc"*.sh"
zinit load $SHELL_CONFIG_DIR

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

compinit

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

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
