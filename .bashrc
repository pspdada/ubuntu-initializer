# personal
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'
alias clean="clear"
alias cls="clear"
alias clc="clear"
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
alias nv="nvidia-smi"
alias jobs="jobs -l"
alias python="python3"

export HF_ENDPOINT=https://hf-mirror.com
# 注意端口号要和经过 ssh 转发的端口号一致
export http_proxy=http://127.0.0.1:11451
export https_proxy=http://127.0.0.1:11451
export no_proxy="127.0.0.1, localhost, *.cnn.com, 192.168.1.10, domain.com:8080"

conda activate psp
