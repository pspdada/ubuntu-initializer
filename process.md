## This file is the process to initailize the user environment on Ubuntu

### Init ssh key pair login

In the local machine, generate the ssh key pair in the directory `~/.ssh/`:

```bash
ssh keygen
```

In the remote machine, create the directory `~/.ssh/` and the file `~/.ssh/authorized_keys`:

```bash
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
```

Copy the content of the local machine's `~/.ssh/id_rsa.pub` to the remote machine's `~/.ssh/authorized_keys`:

```bash
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

### Install conda

#### 下载安装包

从 `https://repo.anaconda.com/archive/` 下载最新的 `Anaconda3` 安装包

或者从清华镜像源 `https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/` 下载安装包

使用 `curl -O https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh` 下载安装包

使用 `bash ~` 命令执行安装包

```bash
bash Anaconda3-2024.06-1-Linux-x86_64.sh
```

#### 配置环境变量

```bash
conda init
```

#### 配置镜像源

将 `~/.condarc` 中的内容替换为以下内容

```bash
channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r
  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud
  pytorch: https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud

```

使用下列指令测试是否配置成功

```bash
conda clean -i
conda create -n psp python=3.10 -y
```

#### 更新 conda

```bash
conda update conda -y
```

#### 安装 pytorch 相关

```bash
nvidia-smi
# We use pytorch 2.4.0 for vllm
# We needn't to install cuda and cudnn since they are installed automatically by torch
# if cuda version is 12.1
pip install torch==2.4.0 torchvision==0.19.0 torchaudio==2.4.0 --index-url https://download.pytorch.org/whl/cu121 -y
# elif cuda version is 12.4
pip install torch==2.4.0 torchvision==0.19.0 torchaudio==2.4.0 --index-url https://download.pytorch.org/whl/cu124 -y

# then install vllm
pip install vllm==v0.6.1.post1 -y
```

### Download LLM

```bash
conda activate psp
pip install -U huggingface_hub
export HF_ENDPOINT=https://hf-mirror.com
huggingface-cli download --resume-download <model_name> --cache-dir <cache_dir>
```
