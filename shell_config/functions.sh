function program_exists() {
    hash $1 > /dev/null 2>&1
}

function search() {
    if program_exists pikaur; then
        pikaur -Ss $@
    elif program_exists dnf; then
        dnf search $@
    else
        echo "Could not determine package manager"
    fi
}

function install() {
    if program_exists pikaur; then
        pikaur -S $@
    elif program_exists dnf; then
        sudo dnf install $@
    fi
}

function mr() {
    if [[ ! -d ~/.Trash ]]
    then
       mkdir ~/.Trash
    fi
    mv $@ ~/.Trash
}

function vga-start() {
    xrandr --output VGA-1 --mode 1920x1080 --right-of LVDS-1
}

function vga-stop() {
    xrandr --output VGA-1 --off
}

function average() {
    awk '{sum+=$1} END {print sum/NR}' $1
}

function cheat() {
    case $1 in
        'git')
            zathura ~/Sync/computer/refrence/github-git-cheat-sheet.pdf;;
        'vim')
            zathura ~/Sync/computer/refrence/vi-vim-cheat-sheet-and-tutorial.pdf;;
        'gdb')
            zathura ~/Sync/computer/refrence/gdb-refcard.pdf;;
        'c++')
            zathura ~/Sync/computer/refrence/cpp_reference_sheet.pdf;;
        'task')
            zathura ~/Sync/computer/refrence/task-2.3.0.ref.pdf;;
        'zsh')
            zathura ~/Sync/computer/refrence/zsh_refcard.pdf;;
        'bash')
            zathura ~/Sync/computer/refrence/shellcheatsheet.pdf;;
        'blender')
            zathura ~/Sync/computer/refrence/blender-2-5-key-bindings.pdf;;
        'regex')
            zathura ~/Sync/computer/refrence/davechild_regular-expressions.pdf;;
        'awk')
            zathura ~/Sync/computer/refrence/awk_quickref.pdf;;
        'systemd')
            cat ~/Sync/computer/refrence/systemd_unit.service;;
        *)
            echo "Cheat not found, supported cheats: \n\tgit, vim, gdb, c++, task, zsh, bash, blender, regex, awk, systemd"
    esac
}

function mgrab() {
    youtube-dl -x --audio-format m4a $1
    mv *.m4a ~/Music
}

nuke() {
    mkdir empty_dir
    rsync -a --delete empty_dir $1
    rmdir empty_dir
}

function clean_gitbranches() {
    git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -d
}

function update_display() {
    echo "Note this will paste commands in open vim sessions as well..."
    for _pane in $(tmux list-panes -a -F '#{pane_id}'); do tmux send -t ${_pane} "export DISPLAY=${DISPLAY}" ENTER ; done
}


function reset_xinput() {
    setxkbmap -option ctrl:nocaps
    xmodmap ~/.Xmodmaprc
    for id in $(xsetwacom --list devices | sed -re 's/.*id: ([0-9]*).*/\1/g'); do
        xsetwacom set $id MapToOutput 1920x1200+1280+0
    done
}

function firefox-container() {
	podman run -d --rm --name=firefox \
		-p 5800:5800 \
		-e DISPLAY_WIDTH=1920 \
		-e DISPLAY_HEIGHT=1080 \
		-e ENABLE_CJK_FONT=1 \
		--shm-size 2g \
		jlesage/firefox
}

function mkd() {
    mkdir -p "$@" && cd "$_"
}

function convert_h265() {
    input_file=$1
    orig_file=${input_file}.orig
    mv $input_file $orig_file
    ffmpeg -i ${orig_file} -c:v hevc_nvenc -vtag hvc1 -c:a copy ${input_file}
}

if [ -f ./work_functions.sh ]; then
    source work_functions.sh
fi
