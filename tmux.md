### tmux 相关

`tmux new -s psp`：创建一个 session

`Ctrl+b d`：分离 session 但不删除

`tmux a -t psp`：重新进入 session

`tmux kill-session -t psp`：关闭一个 session，或者在会话中按 `Ctrl+d` 退出

`tmux ls`：查看所有 session

### tmux 内部中的常用命令

`Ctrl+b [`：上下滚动

`tmux split-window`：将窗口分成多个窗格

`tmux select-pane -U`：光标切换到上方窗格

`tmux select-pane -D`：光标切换到下方窗格

`Ctrl+b d` 或 `tmux detach`：分离 session 但不删除

`Ctrl+b "`：上下分屏

`Ctrl+b o`：切换当前的分屏

`Ctrl+b x`：关闭一个屏幕（如上下分屏）
