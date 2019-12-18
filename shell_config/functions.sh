function search() {
    pikaur -Ss $@
}

function install() {
    sudo pikaur -S $@ #|| sudo aura -Axa --hotedit $@
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
