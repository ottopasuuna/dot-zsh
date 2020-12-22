# ZSH Theme - Preview: http://dl.dropbox.com/u/4109351/pics/gnzh-zsh-theme.png
# Based on bira theme
# Modified by Carl Hofmeister

# load some modules
autoload -U colors zsh/terminfo # Used in the colour alias below
colors
setopt prompt_subst

# make some aliases for the colours: (could use normal escape sequences too)
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$fg[${(L)color}]%}'
done
eval PR_NO_COLOR="%{$terminfo[sgr0]%}"
eval PR_BOLD="%{$terminfo[bold]%}"

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  eval PR_USER='${PR_GREEN}%n${PR_NO_COLOR}'
  eval PR_USER_OP='${PR_GREEN}%#${PR_NO_COLOR}'
  local PR_PROMPT='$PR_NO_COLOR➤ $PR_NO_COLOR'
else # root
  eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
  eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
  local PR_PROMPT='$PR_RED➤ $PR_NO_COLOR'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
else
  eval PR_HOST='${PR_GREEN}%M${PR_NO_COLOR}' # no SSH
fi

function git_status_if_in_repo() {
    if git -C . rev-parse >/dev/null 2>&1 ; then
        git_super_status
    fi
}

function get_background_jobs_prompt() {
    local num_jobs=$(jobs | wc -l)
    if [[ $num_jobs -gt 0 ]]; then
        echo "[$num_jobs]"
    fi
}

local return_code="%(?..%{$PR_RED%}%? ↵%{$PR_NO_COLOR%})"

local user_host='${PR_USER}${PR_CYAN}@${PR_HOST}'
local current_dir='%{$PR_BLUE%}%~%{$PR_NO_COLOR%}'
local git_branch='$(git_status_if_in_repo)%{$PR_NO_COLOR%}'
local conda_env='%{$PR_BOLD%}%{$PR_GREEN%}${CONDA_DEFAULT_ENV}%{$PR_NO_COLOR%}'
local py_venv='%{$PR_BOLD%}%{$PR_GREEN%}${VENV_NAME}%{$PR_NO_COLOR%}'
local job_indicator='%{$PR_BOLD%}%{$PR_MAGENTA%}$(get_background_jobs_prompt)%{$PR_NO_COLOR%}'

PROMPT="╭─${user_host} ${current_dir} ${py_venv} ${conda_env} ${git_branch}
╰─$PR_PROMPT "
RPS1="${return_code}${job_indicator}"

ZSH_THEME_GIT_PROMPT_CACHE=1
ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[yellow]%} "
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
