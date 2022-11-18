---
template: overrides/main.html
categories:
    - Lua
---

# [team call]{https://github.com/ssJSKFJDJ/plugin/tree/main/Mutiple%20Files/team%20call}

!!! Info inline
    仿SitaNya的[team call功能]{有且只有call, 其他的虽然能写进但是好麻烦。。}，方便kp开团或公布信息时艾特调查员们。

!!! Bug
    - 少数汉字在team show时会变成乱码；
    - 在dd版本过低或使用miraiandroid的2.6.4版本dice下，无法转义{at}。

???+ example "To do list"
    - [x] 自动清除群team清空之后的缓存
    - [x] 实现一次操作多名调查员
    - [ ] 加入kp设置功能，使每群只有kp可以使用team call~(不过真的有必要吗？)~

### 文件目录
```
plugin
    |——call.lua
    |——call
          |——list.json
```

### 历史修改记录

{{ git_show_history_log }}
