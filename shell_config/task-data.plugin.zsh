# task-data.zsh - Automatically set TASKDATA when .task directory exists
#
# This plugin detects when the current working directory contains a `.task`
# directory and sets TASKDATA accordingly. Useful with taskwarrior.

# Function to update TASKDATA based on current directory
_task_data_update() {
    if [[ -d "$PWD/.task" ]]; then
        export TASKDATA="$PWD/.task"
    else
        unset TASKDATA
    fi
}

# Hook into directory changes
autoload -U add-zsh-hook
add-zsh-hook chpwd _task_data_update

# Run once on plugin load for current directory
_task_data_update
