
alias ls='ls --color=tty'
alias la="ls -a"
alias sl="ls"
alias ll="ls -l"
alias vim="nvim"
alias vi="nvim"
alias t="task"
alias ta="task add"
alias tm="task mod"
alias tw="vim +TW"
alias ti="timew"
alias yt="youtube-viewer -C"
alias music="ncmpcpp"
alias ytmusic="mpsyt"
alias vimrc="nvim ~/.vimrc"
alias zshrc="nvim ~/.zshrc"
alias g++="g++ -Wall -pedantic"
alias makeandroid="./gradlew assembleDebug && adb install -r app/build/outputs/apk/app-debug.apk"
alias upass="sudo umount ~/.password-store"
alias modelsim="/opt/altera/16.0/modelsim_ase/bin/vsim"
alias buspirate="picocom -b 115200 /dev/buspirate"
alias arch2="sudo systemd-nspawn -b -D ~/vm/arch2 "
alias weather="curl wttr.in"
alias ealias="$EDITOR $SHELL_CONFIG_DIR/aliases.sh"
alias sctl="systemctl"
alias usctl="systemctl --user"

# Git aliases
# alias gl="git log --format=\"%C(auto)%h %d %Creset%s%n%Cgreen%ar %C(magenta)%an\" --graph --all"
alias gst="git status"
alias gd="git diff"
alias gca="git commit -a"
alias gcam="git commit -am"
alias gp="git push"
# From OMZ git plugin:
alias glg='git log --stat'
alias glo='git log --oneline --decorate'
alias glod='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'\'' --date=short'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'
alias glola='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'' --all'

alias mcli="make clean ui libs"

for n in {1..9}; do
    alias $n="%$n";
done

