#!/bin/bash

function changeRepos() {
    echo "Changing repository to Tsinghua mirror"

    sudo cp /etc/apt/sources.list.d/ubuntu.sources /etc/apt/sources.list.d/ubuntu.sources.bak
    echo '' | sudo tee /etc/apt/sources.list.d/ubuntu.sources >/dev/null
    sudo cat ./tsinghua_sources/deb_sources | sudo tee /etc/apt/sources.list.d/ubuntu.sources >/dev/null

    echo "Repository changed to Tsinghua mirror"
}

# Install some commonly used packages
function installCommonPackages() {
    echo "Installing common packages"

    sudo apt-get install -y curl wget git vim htop ssh tmux python3 python3-pip fd-find nodejs npm
    sudo npm install -g tldr
    git config --global http.proxy http://127.0.0.1:7890
    git config --global https.proxy http://127.0.0.1:7890
    git config --global credential.helper store # store git credentials

    # change pip source
    # pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple some-package # for temporary use
    python -m pip install -i https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple --upgrade pip
    pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple

    echo "Common packages installed"
}

# Install and initialize zsh
function installZsh() {
    echo "Installing Zsh"

    sudo apt-get update -y
    sudo apt-get install -y zsh
    sudo apt-get install -y zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel9k
    sudo cat .zshrc | sudo tee ~/.zshrc
    chsh -s /usr/bin/zsh

    echo "Zsh installed and set as default shell"
}

# append to .*rc
function appendToRc() {
    sudo cat .bashrc | sudo tee -a ~/.bashrc
    sudo cat .vimrc | sudo tee ~/.vimrc
}

# Install Nvidia driver
function installNvidiaDriver() {
    echo "Installing Nvidia driver"
    nvidia-detector
    sudo apt-get install -y nvidia-driver-550
    # for test:
    # nvidia-smi

    echo "Installing CUDA"
    wget https://developer.download.nvidia.com/compute/cuda/12.4.1/local_installers/cuda_12.4.1_550.54.15_linux.run
    sudo sh cuda_12.4.1_550.54.15_linux.run

    echo "export CUDA_HOME=/usr/local/cuda-12.4" | sudo tee -a ~/.zshrc
    echo "export PATH=$PATH:/usr/local/cuda-12.4/bin" | sudo tee -a ~/.zshrc
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-12.4/lib64" | sudo tee -a ~/.zshrc
    # for test:
    # nvcc -V

    echo "Installing cuDNN"
    sudo dpkg -i cudnn-local-repo-ubuntu2204-8.9.7.29_1.0-1_amd64.deb
    sudo cp /var/cudnn-local-*/cudnn-*-keyring.gpg /usr/share/keyrings/
    cd /var/cudnn-local-repo-ubuntu2204-8.9.7.29 || exit
    chmod +x libcudnn8_8.9.7.29-1+cuda12.2_amd64.deb libcudnn8-dev_8.9.7.29-1+cuda12.2_amd64.deb libcudnn8-samples_8.9.7.29-1+cuda12.2_amd64.deb
    sudo dpkg -i libcudnn8_8.9.7.29-1+cuda12.2_amd64.deb
    sudo dpkg -i libcudnn8-dev_8.9.7.29-1+cuda12.2_amd64.deb
    sudo dpkg -i libcudnn8-samples_8.9.7.29-1+cuda12.2_amd64.deb
    sudo apt-get install -y libcudnn8-samples
    sudo apt-get install -y libfreeimage-dev

    pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124
}

# Install python packages
function installPythonPackages() {
    echo "Installing python packages"

    sudo python3 -m pip install --user pipx
    python3 -m pipx ensurepath # add pipx to PATH
    pipx install poetry
    pipx upgrade poetry

    poetry completions bash >>~/.bash_completion
    poetry completions zsh >~/.zfunc/_poetry
    echo "fpath+=~/.zfunc" | sudo tee -a ~/.zshrc
    echo "autoload -Uz compinit && compinit" | sudo tee -a ~/.zshrc

    sudo apt-get install -y python3-socks
    pip3 install ninja pysocks

    echo "export http_proxy=socks5h://127.0.0.1:7890" | sudo tee -a ~/.zshrc
    echo "export https_proxy=socks5h://127.0.0.1:7890" | sudo tee -a ~/.zshrc
    echo "export no_proxy="127.0.0.1, localhost, *.cnn.com, 192.168.1.10, domain.com:8080"" | sudo tee -a ~/.zshrc

    echo "Python packages installed"

}

# cleanup
function cleanup() {
    echo "Cleanup"

    sudo apt-get autoremove -y
    sudo apt-get autoclean -y
    sudo apt-get clean -y
    echo "Cleanup done"
}
