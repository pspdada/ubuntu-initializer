## This file intends to provide the way to install dae

### 启动 ip 转发

```
vim /etc/sysctl.conf
```

```bash
# Write the following lines to the file
net.ipv4.ip_forward=1
net.ipv6.conf.all.forwarding=1
```

Enable the changes

```bash
sysctl -p
```

查看系统架构

```bash
uname -a
```

### 安装 dae

```bash
wget -P ~/tmp/ https://github.com/daeuniverse/dae/releases/download/v0.7.1/dae-linux-x86_64.zip
sudo pip install unzip
unzip /tmp/dae-linux-x86_64.zip -d /tmp/dae
cd /tmp/dae
# 创建配置目录
mkdir -p /etc/dae
# 将案例配置文件移动到配置目录
mv example.dae /etc/dae
# 创建最小配置文件
cat <<EOF> /etc/dae/config.dae
global{}
routing{}
EOF
# 设置配置文件权限,限制只有配置文件所有者才可以读写。不设置 dae 无法启动
chmod 0640 /etc/dae/config.dae
# 创建数据目录
mkdir -p /usr/local/share/dae/
# 将geo数据库文件移动到数据目录
mv geoip.dat geosite.dat /usr/local/share/dae/
# 添加可执行权限
sudo chmod +x dae-linux-x86_64
# 将主程序文件安装到用户 bin 目录
mv dae-linux-x86_64 /usr/bin/dae
# 将服务文件移动到 systemd 目录
mv dae.service /etc/systemd/system/
# 刷新配置
sudo systemctl daemon-reload
# 启动 + 自启
sudo systemctl enable dae.service --now
rm -rf /tmp/dae-linux-x86_64.zip
rm -rf /tmp/dae
cd /etc/dae
```

查看服务器 lan 口名称

```bash
ip a
```

编辑配置文件

```bash
vim /etc/dae/config.dae
```

重启 dae 服务

```bash
sudo systemctl restart dae
```

监控 dae 服务

```bash
sudo journalctl -xfu dae.service
```

关闭 dae 并停止自启

```bash
sudo systemctl disable dae.service --now
```
