---
template: overrides/main.html
---

{{dolly}}

# ssJSKFJDJ

[![License](https://img.shields.io/github/license/ssJSKFJDJ/.github.svg)](http://www.gnu.org/licenses)
[![Netlify Status](https://api.netlify.com/api/v1/badges/9452c174-42c2-44b3-b3e5-90e79fda77c4/deploy-status)](https://ssjskfjdj.netlify.app/)
[![](https://img.shields.io/badge/☃️ssJSKFJDJ♬-971050440-blue)](https://jq.qq.com/?_wv=1027&k=y81MmDpz)
[![](https://img.shields.io/badge/team-Dice!-black)](https://github.com/orgs/ssJSKFJDJ/teams/dice/repositories)
<!-- [![](https://img.shields.io/badge/team-OlivaOS-black)](https://github.com/orgs/ssJSKFJDJ/teams/olivaos/repositories) -->

> for script or mod.

<img src="https://ghchart.rshah.org/cypress0522" />

<<<<<<< HEAD
**Changelog:**
=======
## Contribute
>>>>>>> a0b2fe578e868cfc9b24c4da6e0be0ebf4f37e76

{{ git_show_history_log }}

<<<<<<< HEAD
## Contribute

!!! tips inline
    1. [plugin](./#pluginlua)
    2. [PublicDeck](./#publicdeck)
    3. [mod](./#module)
    4. [docs](./mkdocs)

!!! warning
    ### 再三强调
    为做出贡献务必 **按照格式和规范** 提交pr！
    这样有利于提高效率。
    ~~(也很省事)~~

=======
>>>>>>> a0b2fe578e868cfc9b24c4da6e0be0ebf4f37e76
### plugin(Lua插件)

> 如果你是Dice!脚本作者，那么你可以[fork plugin](https://github.com/ssJSKFJDJ/plugin/fork)仓库，然后按格式提交PR。

[![License](https://img.shields.io/github/license/ssJSKFJDJ/plugin.svg)](http://www.gnu.org/licenses)
[![Downloads](https://img.shields.io/github/downloads/ssJSKFJDJ/plugin/total.svg)](https://github.com/ssJSKFJDJ/plugin/releases)
[![GitHub last commit](https://img.shields.io/github/last-commit/ssJSKFJDJ/plugin.svg)](https://github.com/ssJSKFJDJ/plugin/commits)

[![issue数量](https://img.shields.io/github/issues/ssJSKFJDJ/plugin.svg)](https://github.com/ssJSKFJDJ/plugin/issues)
[![PR数量](https://img.shields.io/github/issues-pr/ssJSKFJDJ/plugin.svg)](https://github.com/ssJSKFJDJ/plugin/pulls)
[![单个lua文件](https://img.shields.io/github/directory-file-count/ssJSKFJDJ/plugin/Single%20File?extension=lua&label=Single%20Lua%20File&type=file)](https://github.com/ssJSKFJDJ/plugin/tree/main/Single%20File)
[![多个lua文件](https://img.shields.io/github/directory-file-count/ssJSKFJDJ/plugin/Mutiple%20Files?label=Mutiple%20lua%20File&type=dir)](https://github.com/ssJSKFJDJ/plugin/tree/main/Single%20File)

<<<<<<< HEAD
=== ":octicons-file-16: 提交单个`*.lua`文件"

      1. 若您提交的是单个`*.lua`文件，请在脚本前四行务必写上如下注释，否则审核将会被打回，这么做的理由是为了让您的脚本在被他人下载使用时，让他人知晓作者是谁，(若有报错)如何联系，能否二次演绎(协议)。
      ```lua title="Single.lua"
      -------------------------------
      -- @脚本名 by 你的名字或联系方式
      -- @license 协议名(比如MIT.)
      -------------------------------
      ```
      1. 随后请将你的lua脚本提交至[Single File](https://github.com/ssJSKFJDJ/plugin/tree/main/Single%20File)文件夹，并在该文件夹下的[README.md](https://github.com/ssJSKFJDJ/plugin/blob/main/Single%20File/README.md)内找到当天日期（如没有就添加一个）写上:
      ```yaml
      日期:
         - 脚本文件（包含.lua扩展名） by 作者名（联系方式)
      #比如:
      2022年10月30日:
         - DailyNews.lua by 简律纯
         - xxx.lua by xxx
      ```

=== ":octicons-file-directory-fill-16: 提交多个`*.lua`文件甚至文件夹"

=======
!!! warning
    ### 再三强调
    请 **按照格式和规范** 提交pr！
    这样有利于提高效率。

=== ":octicons-file-16: 提交单个`*.lua`文件"

      1. 若您提交的是单个`*.lua`文件，请在脚本前四行务必写上如下注释，否则审核将会被打回，这么做的理由是为了让您的脚本在被他人下载使用时，让他人知晓作者是谁，(若有报错)如何联系，能否二次演绎(协议)。
      ```lua title="Single.lua"
      -------------------------------
      -- @脚本名 by 你的名字或联系方式
      -- @license 协议名(比如MIT.)
      -------------------------------
      ```
      2. 随后请将你的lua脚本提交至[Single File](https://github.com/ssJSKFJDJ/plugin/tree/main/Single%20File)文件夹，并在该文件夹下的[README.md](https://github.com/ssJSKFJDJ/plugin/blob/main/Single%20File/README.md)内找到当天日期（如没有就添加一个）写上:
      ```yaml
      日期:
         - 脚本文件（包含.lua扩展名） by 作者名（联系方式)
      #比如:
      2022年10月30日:
         - DailyNews.lua by 简律纯
         - xxx.lua by xxx
      ```

=== ":octicons-file-directory-fill-16: 提交多个`*.lua`文件甚至文件夹"

>>>>>>> a0b2fe578e868cfc9b24c4da6e0be0ebf4f37e76
      1. 若您的脚本包含`*.lua`文件数量过多或是包含文件夹，请将它们全部放在一个以脚本名命名的文件夹内上传，并附上`README.md`简单介绍各个文件的作用以及一些作者信息。
      它们将会是这样的:
      ```
      plugin_name
         |-README.md
         |-part1.lua
         |-part2.lua
         |————dir
               |-file1
               |-file2
      ```
      `README.md`文件内可以这样写(只是为了表现层次，所以尽量使用文件树)：
      ```markdown
      plugin_name
      |  |-part1.lua #用于接受配置指令
      |  |-part2.lua #脚本主体
      |
      |-dir #配置文件存放文件夹
         |-file1 #配置文件..
      
      作者:xxx
      联系方式：xxx@xxx.xxxx
      ```
      2. 随后请将你的文件夹提交至[Mutiple Files](https://github.com/ssJSKFJDJ/plugin/tree/main/Mutiple%20Files)文件夹,并在该文件夹下的[README.md](https://github.com/ssJSKFJDJ/plugin/blob/main/Mutiple%20Files/README.md)内找到当天日期（如没有就添加一个）写上:
      ```yaml
      日期:
         - 你上传的文件夹名称 by 作者名（联系方式)
      #比如:
      2022年10月30日:
         - team call by Pine
         - xxx by xxx
      ```

### PublicDeck(功能牌堆)

> 如果你是牌堆作者，那么你可以[fork PublicDeck](https://github.com/ssJSKFJDJ/PublicDeck)仓库，然后按格式提交PR。

### Module(功能模块)

功能模块。是“主营业务”。
功能模块的收集没有任何像plugin或PublickDeck那样的专门的库，这里只选择功能模块作者在main-pages的master分支的[Module](https://github.com/ssJSKFJDJ/main-pages/tree/master/docs/Module)文件夹下提交功能模块远程下载json的方式来收录Module。在收到PR以及审核通过后，审核人员会将你的功能模块库fork到ssJSKFJDJ。

其一般步骤如下：
1. [fork](https://github.com/ssJSKFJDJ/main-pages/fork) main-pages库。一切都是从这里开始的。
2. 提交你的包含"pkg"字段的功能模块json：
   比如[listen2me](https://github.com/ssJSKFJDJ/listen2me)库提供的json是这样的：
   ```json
   {
     "mod":"listen2me",
     "author":"简律纯",
     "ver":"1.1.8",
     "dice_build":612,
     "brief":"使用mml作曲",
     "pkg":"https://github.com/cypress0522/listen2me/releases/download/v1.1.8/listen2me_v1.1.8.zip",
     "comment":"",
     "helpdoc":{
         "listen2me":"【listen2me[Windows]】\n使用mml语言进行作曲\nhttps://github.com/cypress0522/listen2me"
     }
   }
   ```
   你可以直接[访问](https://github.com/ssJSKFJDJ/main-pages/blob/master/docs/Module/listen2me)来查看该json所在位置。
   这里我们只需要填写"pkg"字段即可，"repo"字段如有请删除。
   
!!! note
    pkg填写的是把功能模块打包好后发布的地址，必须为直链，不一定要在github上!

3. 给你的功能模块库添加`lua`和`dice-mod`标签。
4. 按照格式提交PR。
5. 如有需要一并提交md格式的技术文档。

审核通过后你会在ssJSKFJDJ仓库下找到自己的功能模块库，每次更新功能模块时仅需提交新的pkg字段的json至[Module](https://github.com/ssJSKFJDJ/main-pages/tree/master/docs/Module)文件夹下即可。最后，给bot安装时仅需要在`./DiceQQ/conf/mod/source.list`文件内添加一行写上`https://ssjskfjdj.netlify.app/Module/`，然后重载bot并发送命令`.mod get 你提交的功能模块名`即可完成下载。

!!! note
    论坛写帖子的时候也可以告诉大家这样安装就行了哦，可以使用如下模板：

```markdown
# 1. install

- Dice版本2.6.5beta12(624+)以上安装方法:

  1. 在 `./DiceQQ/conf/mod/source.list`文件内（没有mod文件夹和这文件就新建）输入 `https://ssjskfjdj.netlify.app/Module/`。
  2. 使用 `.system load`命令重载bot，这样做的目的是为了让步骤1里的远程地址生效。
  3. 对bot发送 `.mod get [功能模块名]`命令，等待安装。
  4. 回到第二步，这样做的目的是为了让mod被加载。
  5. Enjoy Your Self!

- Dice版本2.6.4b(612+)以上安装方法：

  1. 浏览器访问 `https://github.com/ssJSKFJDJ/功能模块名`并点击绿色按钮 `Code`下的 `Download Zip`按钮下载仓库压缩包。
  2. 解压压缩包，将里面的文件和文件夹全部丢进 `./DiceQQ/mod/`文件夹内。
  3. 使用 `.system load`命令重载。
  4. Enjoy Your Self!
```

### Mkdocs(技术文档)

> to be...

## License

```
  MIT License

Copyright (c) 2022 ssJSKFJDJ

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
