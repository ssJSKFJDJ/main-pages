---
template: overrides/main.html
categories:
    - Lua
---

# team call

!!! Info
    仿SitaNya的[team call功能]{有且只有call, 其他的虽然能写进但是好麻烦。。}，方便kp开团或公布信息时艾特调查员们。

!!! Bug
    -1. 少数汉字在team show时会变成乱码；
    -2. 在某些神秘力量的影响下，{at}的转义可能会出错；
    -3. 以上两点原因不明，[尚无解决方案]{悲}

???+ example inline "To do list"
    - [x] 自动清除群team清空之后的缓存
    - [ ] [加入kp设置功能，使每群只有kp可以使用team call]{真的有必要吗？}

```文件目录
plugin
    |——call.lua
    |——call
          |——list.json
```

### 历史修改记录
{{ git-show-history-log }}
