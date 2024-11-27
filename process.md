## This file is the process to initialize the user environment on Ubuntu

### Init ssh key pair login

1. In the local machine, generate the ssh key pair in the directory `~/.ssh/`:

```bash
ssh keygen
```

2. In the remote machine, create the directory `~/.ssh/` and the file `~/.ssh/authorized_keys`:

```bash
mkdir ~/.ssh
touch ~/.ssh/authorized_keys
```

3. Copy the content of the local machine's `~/.ssh/id_rsa.pub` to the remote machine's `~/.ssh/authorized_keys`:

```bash
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
```

4. Check the SSH key has been added successfully:

```bash
ssh user@remote_host 'cat ~/.ssh/authorized_keys'
```

### Install conda

#### 下载安装包

1. 下载最新的 `Anaconda3` 安装包

- 从 `https://repo.anaconda.com/archive/`
- 或者从清华镜像源 `https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/`
- 或者从哈工深镜像源 `https://mirrors.osa.moe/anaconda/archive/Anaconda3-2024.10-1-Linux-x86_64.sh` 下载

1. 使用 `curl` 命令下载安装包

```bash
curl -O https://mirrors.osa.moe/anaconda/archive/Anaconda3-2024.10-1-Linux-x86_64.sh
```

3. 使用 `bash` 命令执行安装包

```bash
bash Anaconda3-2024.10-1-Linux-x86_64.sh
```

#### 配置环境变量

1. 初始化 Conda 环境：

```bash
conda init
```

如果此时找不到 `conda` 命令，可以使用以下命令：

```bash
/your/path/to/anaconda3/bin/conda init
```

#### 配置镜像源

1. 将 `~/.condarc` 中的内容替换为以下内容

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

2. 使用下列指令测试是否配置成功

```bash
conda clean -i
conda create -n psp python=3.10 -y
```

#### 更新 conda

1. 更新 Conda：

```bash
conda update conda -y
```

#### 安装 pytorch 相关

1. 检查 CUDA 版本：

```bash
nvidia-smi
```

2. 安装 PyTorch 及相关库：

```bash
# We use pytorch 2.4.0 for vllm
# We needn't to install cuda and cudnn since they are installed automatically by torch
# if cuda version is 12.1
pip install torch==2.4.0 torchvision==0.19.0 torchaudio==2.4.0 --index-url https://download.pytorch.org/whl/cu121
# elif cuda version is 12.4
pip install torch==2.4.0 torchvision==0.19.0 torchaudio==2.4.0 --index-url https://download.pytorch.org/whl/cu124
```

3. 安装 VLLM：

```bash
pip install vllm==v0.6.1.post1 -y
```

### Download LLM

1. 激活 Conda 环境：

```bash
conda activate psp
```

2. 安装 Hugging Face Hub：

```bash
pip install -U huggingface_hub
```

3. 设置 Hugging Face 镜像源：

```bash
export HF_ENDPOINT=https://hf-mirror.com
```

4. 下载模型：

```bash
huggingface-cli download <model_name> --cache-dir <cache_dir>
# 例如：
huggingface-cli download Qwen/Qwen2.5-14B-Instruct --cache-dir ./.cache
```
