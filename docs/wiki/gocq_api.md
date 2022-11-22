# gocq_api

!!! Info inline 

    基于gocq的网络api调用写出的一个拓展函数库，便于各位大佬写插件时调用api。
    请配合 [API|go-cqhttp帮助中心]{https://docs.go-cqhttp.org/api/} 使用此库。

??? Quote inline end 

    其实就是个低技术力的拓展函数库啦，要是能给大佬们帮上忙我就太荣幸了：）

???+ Note "配置http通信" 

    如果你早已配置好这些，请忽略这块内容。
    本函数库仅支持http post与http get两种api调用方式，所以在使用前请配置好http通信。
    参考配置：
    ``` yml
    - http: # HTTP 通信设置
      address: 127.0.0.1:15700 # HTTP监听地址，这里的端口【15700】如果改为了其他的，需在gocq_api.lua中同步改动http_port的值
      timeout: 5 # 反向 HTTP 超时时间, 单位秒，<5时将被忽略
      long-polling: # 长轮询拓展
        enabled: false       # 是否开启
        max-queue-size: 2000 # 消息队列大小，0 表示不限制队列大小，谨慎使用
      middlewares:
        <<: *default # 引用默认中间件
    ```

## 一.下载与安装

要调用一个库，首先你得[下载它]{废话}

你可以在。。。。。。。【之后再补】。。。。。。。。下载到这个库。

将下载的压缩包解压，你会得到以下文件：

``` md
    |——gocq_api.lua
    |——gocq_api
          |——api_list.json
```

一个名叫gocq_api的lua文件，与一个同名的文件夹，文件夹中含有一个api_list.json文件。

接下来只要把gocq_api.lua和同名的文件夹一起扔进diceqq/plugin文件夹里面，对你的骰娘使用system load指令就好了。

!!! note 

    当然，如果你希望的话，gocq_api.lua也可以放进diceki/lua文件夹里。
    但如果不修改其中路径的话，gocq_api文件夹就只能放在diceqq/plugin文件夹中。

## 二.调用函数

安装完成后，想要在插件中调用这个库，只需要一行这样的代码：

```lua
gapi = require("gocq_api")
```

!!! note inline end

    这个变量名，也就是gapi，当然可以换成其他的，只要你能记得住就可以了。

然后，你就可以使用gapi.http_get()和gapi.http_post()来调用api函数了。

## 三.函数介绍

本库包含两个函数：

- **http_post("终结点",参数1,参数2......)**
- **http_get("终结点",参数1,参数2......)**

两个函数分别对应了两种api调用方法：post与get。两种方法的差异请参考 [API|go-cqhttp帮助中心]{https://docs.go-cqhttp.org/api/} 。

**api参数请严格按照 [API|go-cqhttp帮助中心]{https://docs.go-cqhttp.org/api/} 中的排列顺序，即从上到下，按序传入，否则可能会出现错误。**

例如，如果在API|go-cqhttp帮助中心中的内容如下：


终结点：/send_msg
Data table, columns centered
| 字段名         | 数据类型| 默认值  | 说明                                                                             |
| :------------: | :-----: | :-----: | :------------------------------------------------------------------------------: |
| `message_type` | `string`| `-`     |`消息类型, 支持private、group,分别对应私聊、群组,如不传入,则根据传入的*_id参数判断` |
| `user_id`      | `int64` | `-`     |`对方 QQ 号 ( 消息类型为 private 时需要 )`                                         |
| `group_id`     | `int64` | `-`     |`群号 ( 消息类型为 group 时需要 )`                                                 |
| `message`      |`message`| `-`     |`要发送的内容`                                                                     |
| `auto_escape`  |`boolean`| `flase` |`消息内容是否作为纯文本发送 ( 即不解析 CQ 码 ) , 只在 message 字段是字符串时有效`   |

那么你可以这么传入参数：gapi.http_post("send_msg", "group", nil, 971050440, "test,test~").

然后，在调用这个函数时，骰娘便会向群聊[971050440]{☃️ssJSKFJDJ♬}发送一条信息: “test,test~”。

!!! note "函数返回值"

    这个函数会返回一个值，也就是API|go-cqhttp帮助中心中有说明的响应json数据，你可以设置一个变量来接收并发送它。
