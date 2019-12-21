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

#plugin management with zplug
source /usr/share/zsh/scripts/zplug/init.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
zplug "zplug/zplug"
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "caarlos0/zsh-open-pr"
zplug "esc/conda-zsh-completion"
zplug "supercrabtree/k"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "arzzen/calc.plugin.zsh"
zplug "~/Programming/Shell/manor", from:local
zplug "$SHELL_CONFIG_DIR", from:local, use:"*.sh"
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load


export SPACESHIP_CONDA_SYMBOL='\uf81f'
export SPACESHIP_PROMPT_ADD_NEWLINE=false
# export SPACESHIP_CONDA_PREFIX='conda '
export SPACESHIP_CONDA_COLOR=40
export SPACESHIP_GIT_BRANCH_COLOR=yellow
export SPACESHIP_DIR_COLOR=81 # light blue

source ~/.zsh-theme/zsh-git-prompt/zshrc.sh
source ~/.zsh-theme/gnzh.zsh-theme

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

