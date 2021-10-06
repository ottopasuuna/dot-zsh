
# XDG base directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share

#Encourange use of XDG directories
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export LESSHISTFILE=-
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export DVDCSS_CACHE="$XDG_CACHE_HOME"/dvdcss

# Define executable names for common programs
export EDITOR="nvim"
export TERMINAL=termite
export BROWSER=firefox

export TERM=xterm-256color

export LC_CTYPE=en_US.UTF-8

export LS_COLORS="di=00;34"
if [[ $USER == "carl" ]]; then
    export GTK_IM_MODULE=ibus
    # export QT_STYLE_OVERRIDE=gtk
    export XMODIFIERS=@im=ibus
    export QT_IM_MODULE=ibus
    export DISPLAY=:0.0
    export TS_SLOTS=4

    # Path configurations
    export GOPATH=~/Programming/go
    export KSP=~/.steam/steam/SteamApps/common/Kerbal\ Space\ Program/
    export RACK_DIR=~/Programming/VCVRack/Rack-SDK
    export ANDROID_HOME=/opt/android-sdk/tools
fi



export PATH=$HOME/bin:$HOME/.luarocks/bin:$GOPATH/bin:/usr/local/bin:$PATH


# Conda settings
export CONDA_ROOT=$XDG_DATA_HOME/miniconda3

if [ -f ./work_env_vars.sh ]; then
    source ./work_env_vars.sh
fi
