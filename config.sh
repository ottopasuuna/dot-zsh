description="Zshell config files"

link_map=(
    [zshrc]=$HOME/.zshrc
    [zsh-theme]=$HOME/.zsh-theme
    [shell_config]=$HOME/.config/shell
    [bashrc]=$HOME/.bashrc
)

__install__() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
}
