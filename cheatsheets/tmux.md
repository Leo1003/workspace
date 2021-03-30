# Cheatsheet for Tmux

## Prefix
在 Tmux 中，大部分的操作需要一個按鍵組合。我們稱為 Prefix，預設是 Ctrl + B。

在後文會以 `<Prefix>` 表示。

## Tmux commands

## Tmux Keys
- `<Prefix> + d`: 脫離Tmux
- `<Prefix> + t`: 時鐘模式
- `<Prefix> + ?`: 查詢按鍵
- `<Prefix> + [`: 進入選取模式
- `<Prefix> + ]`: 貼上
- `<Prefix> + :`: 進入指令模式

### Session
- `<Prefix> + (`: 切換到上一個工作區
- `<Prefix> + )`: 切換到上一個工作區
- `<Prefix> + s`: 列出工作區
- `<Prefix> + $`: 命名工作區

### Tab
- `<Prefix> + c`: 新增分頁
- `<Prefix> + w`: 列出分頁
- `<Prefix> + p`: 切換到上一個分頁
- `<Prefix> + n`: 切換到下一個分頁
- `<Prefix> + <0~9>`: 切換到n號分頁
- `<Prefix> + <`: 分頁往左移
- `<Prefix> + >`: 分頁往右移
- `<Prefix> + f`: 搜尋分頁
- `<Prefix> + ,`: 命名分頁
- `<Prefix> + &`: 強制結束分頁

### Pane
- `<Prefix> + %`: 垂直分割
- `<Prefix> + |`
- `<Prefix> + "`: 水平分割
- `<Prefix> + -`
- `<Prefix> + \`: 滿版垂直分割
- `<Prefix> + _`: 滿版水平分割
- `<Prefix> + o`: 交換面板
- `<Prefix> + q`: 顯示面板編號
- `<Prefix> + x`: 強制結束面板
- `<Prefix> + <h,j,k,l>`: 選擇面板
- `<Prefix> + <方向鍵>`
- `<Prefix> + Shift + <h,j,k,l>`: 調整面板大小
- `<Prefix> + {`: 目前面板往左
- `<Prefix> + }`: 目前面板往右
- `<Prefix> + z`: 目前面板最大化

### Plugins
需安裝對應的套件才有效
- `<Prefix> + <Shift> + f`: 啟動fingers (快速複製)
    - [Tmux fingers](https://github.com/Morantron/tmux-fingers)

## References
- [tmux-cheatsheet.markdown](https://gist.github.com/MohamedAlaa/2961058)

