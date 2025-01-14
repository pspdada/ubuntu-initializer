# pretty terminal
export TERM="xterm-256color"

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
