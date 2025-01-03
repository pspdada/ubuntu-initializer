# pretty terminal
export TERM="xterm-256color"
source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -Uz compinit && compinit

# aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'
alias clean="clear"
alias clc="clear"
alias cls="clear"
alias install="sudo apt-get install"
alias update="sudo apt-get update && sudo apt-get upgrade -yq"
alias mkdir="mkdir -p"
alias mv="mv -i"
alias df="df -h"
alias back="cd -"
alias up="cd .."
alias fd="fdfind"
alias find="fdfind"
alias df="df -h"
alias free="free -h"
alias nv="nvidia-smi"
alias jobs="jobs -l"
alias start="nohup python3 main.py&"
alias python="python3"

function noproxy {
    export http_proxy=""
    export https_proxy=""
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    echo "Proxy settings cleared."
}

export HF_ENDPOINT=https://hf-mirror.com
# 注意端口号要和经过 ssh 转发的端口号一致
export http_proxy=http://127.0.0.1:11451
export https_proxy=http://127.0.0.1:11451
export no_proxy="127.0.0.1, localhost, *.cnn.com, 192.168.1.10, domain.com:8080"

git config --global http.proxy $http_proxy
git config --global https.proxy $https_proxy
git config --global user.name "psp_dada"
git config --global user.email "1824427006@qq.com"
git config --global lfs.largefilewarning false
