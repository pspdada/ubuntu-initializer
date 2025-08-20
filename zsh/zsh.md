## 安装 Zsh

### 从源安装（配合 vscode 十分方便）

```bash
cd ~
wget -Oc zsh.tar.xz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && unxz zsh.tar.xz && tar -xvf zsh.tar -C zsh --strip-components 1
cd zsh
# compile zsh
./configure --prefix=$HOME
make
make install
```

然后启动 `zsh`:

```bash
exec ~/bin/zsh -l
```

## 添加别名

将本项目中的 `.aliases` 文件复制到 `~` 文件夹中，然后添加进 `~/.zshrc`：

```bash
echo '[[ ! -f ~/.aliases ]] || source ~/.aliases' >> ~/.zshrc
```

## 安装 Powerlevel10k

将本项目中的 `.p10k.zsh` 文件复制到 `~/.zsh/` 文件夹中，然后：

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
echo 'source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
echo '[[ ! -f ~/.zsh/.p10k.zsh ]] || source ~/.zsh/.p10k.zsh' >>~/.zshrc
```

在配置完成后，如果希望重新配置，重启整个流程，直接执行 `p10k configure` ，会重新打开配置向导

## 安装 zsh-autosuggestions

```bash
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >>~/.zshrc
```

## 安装 zsh-syntax-highlighting

The repo is [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

```bash
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >>~/.zshrc
```
