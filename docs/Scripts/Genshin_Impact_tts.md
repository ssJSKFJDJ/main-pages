---
template: overrides/main.html
categories:
     - Lua
---

# Genshin_Impact_tts.lua

!!! Question 

	由于工作[繁忙]{我其实是管理组公认的摸鱼🐟大王(笑}，
	生活琐事较多，很遗憾，到目前为止
	此脚本的部分功能还是没有给出一个
	完整的解决方案。

???+ example inline "To-DO List"

	- [ ] 情感要素
	
	- [ ] 转义要素
	
	- [x] 配置要素
	
	- [ ] 语句白名单
	
	- [ ] To be...
	
	[...大胆的尝试？]{都说出来吧💕}
	
=== ":octicons-heart-fill-24:{ .heart } 情感要素"

    ``` lua
	-- 规定了一个表:settings 用于存入api参数.
	-- 初始化表.
	settings = {
		["noise"] = 0,
		["noisew"] = 0,
		["length"] = 0,
		["format"] = "mp3"
	}
    ```

=== ":octicons-arrow-switch-16: 转义要素"

    ``` yaml
	#mood description
	angry: '生气'
	
	#link path:SelfData\GItts\xxx.json
	link: 'data.angry'
    ```
	> 与[情感要素](./)相互链接。
	
=== ":octicons-gear-16: 配置ini"

    ``` ini
	[UserConfig]
	text=* ;生成的文本
	Speaker=* ;与DefaultNpc同理
	noise=0.667 ;控制感情等变化程度
	noisew=0.8 ;控制音素发音长度变化程度
	length=1.2 ;控制整体语速
	DefaultNpc=* ;npcList
	format=mp3 ;wav
    ```


## Code

### I.
```lua title="读写文件函数定义"
--------------------------------------------------------
-- by 简律纯. For 阿尘 22/8/20
-- About API? View more: https://github.com/w4123/vits
--------------------------------------------------------
write_file = function(path, text, mode)
    file = io.open(path, mode)
    file.write(file, text)
    io.close(file)
end

read_file = function(path, mode)
    local text = ""
    local file = io.open(path, mode)
    if (file ~= nil) then
        text = file.read(file, "*a")
        io.close(file)
    else
        return "没有该文件或文件内容为空哦"
    end
    return text
end  
```

### II.
```lua title="定义必要的全局变量"
npcList = {
    "派蒙",
    "凯亚",
    "安柏",
    "丽莎",
    "琴",
    "香菱",
    "枫原万叶",
    "迪卢克",
    "温迪",
    "可莉",
    "早柚",
    "托马",
    "芭芭拉",
    "优菈",
    "云堇",
    "钟离",
    "魈",
    "凝光",
    "雷电将军",
    "北斗",
    "甘雨",
    "七七",
    "刻晴",
    "神里绫华",
    "戴因斯雷布",
    "雷泽",
    "神里绫人",
    "罗莎莉亚",
    "阿贝多",
    "八重神子",
    "宵宫",
    "荒泷一斗",
    "九条裟罗",
    "夜兰",
    "珊瑚宫心海",
    "五郎",
    "散兵",
    "女士",
    "达达利亚",
    "莫娜",
    "班尼特",
    "申鹤",
    "行秋",
    "烟绯",
    "久岐忍",
    "辛焱",
    "砂糖",
    "胡桃",
    "重云",
    "菲谢尔",
    "诺艾尔",
    "迪奥娜",
    "鹿野院平藏"
}

msg_order = {["让"] = "letSpeaker", ["说"] = "doSpeaker", [".GItts"] = "GItts"}

settings = {["noise"] = 0, ["noisew"] = 0, ["length"] = 0, ["format"] = "mp3"}

local dataFolder = getDiceDir() .. "\\plugin\\Genshin_Impact_tts\\data"
local dataPath = dataFolder .. "\\default.json"
local confPath = getDiceDir() .. "\\plugin\\Genshin_Impact_tts\\settings.ini"
local MasterQQ = tonumber(string.match(read_file(getDiceDir() .. "\\conf\\Console.xml"), "<master>(%d+)</master>", 0))
```


### III.
```lua title="INI编辑库"
-------------------------------------------------------------------------
-- EDIT INI FILE
-- No unauthorized use without permission.
-- BY 简律纯.
-- 2022/6/10
-------------------------------------------------------------------------
load_all = function(fileName)
    assert(type(fileName) == "string", "参数“fileName”必须是字符串哦")
    local file = assert(io.open(fileName, "r"), "加载文件时出错：" .. fileName)
    local data = {}
    local section
    for line in file:lines() do
        local tempSection = line:match("^%[([^%[%]]+)%]$")
        if (tempSection) then
            section = tonumber(tempSection) and tonumber(tempSection) or tempSection
            data[section] = data[section] or {}
        end
        local param, value = line:match("^([%w|_]+)%s-=%s-(.+)$")
        if (param and value ~= nil) then
            if (tonumber(value)) then
                value = tonumber(value)
            elseif (value == "true") then
                value = true
            elseif (value == "false") then
                value = false
            end
            if (tonumber(param)) then
                param = tonumber(param)
            end
            data[section][param] = value
        end
    end
    file:close()
    return data
end

save_all = function(fileName, data)
    assert(type(fileName) == "string", "参数“fileName”必须是字符串哦")
    assert(type(data) == "table", "参数“data”必须是一个表！")
    local file = assert(io.open(fileName, "w+b"), "加载文件时出错：" .. fileName)
    local contents = ""
    for section, param in pairs(data) do
        contents = contents .. ("[%s]\n"):format(section)
        for key, value in pairs(param) do
            contents = contents .. ("%s=%s\n"):format(key, tostring(value))
        end
        contents = contents .. "\n"
    end
    file:write(contents)
    file:close()
end

ReadIni = function(IniPath, Section, Key)
    local data = load_all(IniPath)
    return data[Section][Key]
end

WriteIni = function(IniPath, Section, Key, Value)
    local data = load_all(IniPath)
    data[Section][Key] = Value
    save_all(IniPath, data)
end
```


### IV.
```lua title="一些方便后续完善的函数"
checkChinese = function(str)
    local tmpStr = str
    local _, sum = string.gsub(str, "[^\128-\193]", "")
    local _, countEn = string.gsub(tmpStr, "[%z\1-\127]", "")
    if sum - countEn ~= 0 then
        return true
    else
        return false
    end
end

ToStringEx = function(value)
    if type(value) == "table" then
        return table.list(value)
    elseif type(value) == "string" then
        return "'" .. value .. "'"
    else
        return tostring(value)
    end
end

table.list = function(t)
    if t == nil then
        return ""
    end
    local retstr = "{"

    local i = 1
    for key, value in pairs(t) do
        local signal = ","
        if i == 1 then
            signal = ""
        end

        if key == i then
            retstr = retstr .. signal .. ToStringEx(value)
        else
            if type(key) == "number" or type(key) == "string" then
                retstr = retstr .. signal .. "[" .. ToStringEx(key) .. "]=" .. ToStringEx(value)
            else
                if type(key) == "userdata" then
                    retstr =
                        retstr .. signal .. "*s" .. TableToStr(getmetatable(key)) .. "*e" .. "=" .. ToStringEx(value)
                else
                    retstr = retstr .. signal .. key .. "=" .. ToStringEx(value)
                end
            end
        end

        i = i + 1
    end

    retstr = retstr .. "}"
    return retstr
end

spaceKiller = function(str)
    return string.gsub(str, "[%s]+", "+")
end

isFolderExist = function(folderPath)
    return os.execute("cd " .. folderPath)
end

--[[
CER = function(fun, arg1, arg2, arg3, arg4, arg5)
    local i
    local ret, errMessage = pcall(fun, arg1, arg2, arg3, arg4, arg5)
    wrong = ret and "false" or "true"
    --return "是否错误:\n"..错误.." \n\n出错信息:\n" .. (errMessage or "无")
    if wrong == "true" then --错误提示
        --output[i]
        local ret, errMessage = pcall(fun, arg1, arg2, arg3, arg4, arg5)
        return "\n错误详情：\n" .. errMessage
    else --无错误正常执行
        ret, back = pcall(fun, arg1, arg2, arg3, arg4, arg5)
        return back
    end
end
]]

string.split = function(str, split_char)
    local str_tab = {}
    while (true) do
        local findstart, findend = string.find(str, split_char, 1, true)
        if not (findstart and findend) then
            str_tab[#str_tab + 1] = str
            break
        end
        local sub_str = string.sub(str, 1, findstart - 1)
        str_tab[#str_tab + 1] = sub_str
        str = string.sub(str, findend + 1, #str)
    end

    return str_tab
end

getFileList = function(path, exp)
    local a = io.popen("dir " .. path .. exp .. " /b")
    local fileTable = {}
    local str = ""

    if a == nil then
    else
        for l in a:lines() do
            table.insert(fileTable, l)
        end

        for i = 1, #fileTable do
            str = fileTable[i] .. "\n" .. str
        end

        return fileTable
    end
end
```


### V.
```lua title="脚本主体"
-------------------------------------------------------------------------
-- 接下来的才是脚本主体
-- BY 简律纯.
-- 2022/08/22
-------------------------------------------------------------------------
local settings_text =
    [[
[MasterConfig]
nick=nil
QQ=nil

[UserConfig]
noise=0.667
noisew=0.8
length=1.2 
DefaultNpc=*
format=mp3

[AutoUpdate]
Version=v1.2.2]]

if not getUserConf(getDiceQQ(), "GI_tts") then
    mkDirs(getDiceDir() .. "\\plugin\\Genshin_Impact_tts")
    write_file(confPath, settings_text, "w+")
    WriteIni(confPath, "MasterConfig", "QQ", MasterQQ)
    WriteIni(confPath, "MasterConfig", "nick", getUserConf(MasterQQ, "name"))
    WriteIni(confPath, "UserConfig", "noisew", "0.8")
    WriteIni(confPath, "UserConfig", "length", "1.2")
    WriteIni(confPath, "UserConfig", "format", "mp3")
    WriteIni(confPath, "AutoUpdate", "Version", "v1.2.2 ;laset version")
    if not isFolderExist(getDiceDir() .. "\\SelfData\\GItts") then
        expansion, state = 0, "失败，疑似没有SelfData/GItts文件夹 "
    else
        enable = 0
        files = getFileList(getDiceDir() .. "\\SelfData\\GItts", "\\*.json")
        state = "成功 共" .. #files .. "个拓展可用，已启用" .. enable .. "个"
    end
    setUserConf(getDiceQQ(), "GI_tts", true)
    log(os.date("%X") .. "\n> 原神tts:初始化完成~\n> 读取情绪拓展" .. state, 1)
end

-------------------------------------------------
-- 让<speaker>说<text>
-- speaker必须为npcList内容,text支持空格.
-------------------------------------------------
function letSpeaker(msg)
    local npc = string.match(msg.fromMsg, "让(.-)说")

    settings.noise = ReadIni(confPath, "UserConfig", "noise")
    settings.noisew = ReadIni(confPath, "UserConfig", "noisew")
    settings.length = ReadIni(confPath, "UserConfig", "length")
    settings.format = ReadIni(confPath, "UserConfig", "format")

    if npc then
        --return #npcList
        local prefix = "让" .. npc .. "说"
        local text = string.sub(msg.fromMsg, #prefix + 1)
        for i = 1, #npcList do
            if npcList[i] == npc then
                return "[CQ:record,file=http://233366.proxy.nscc-gz.cn:8888?speaker=" ..
                    npcList[i] ..
                        "&text=" ..
                            spaceKiller(text) ..
                                "&noise=" ..
                                    settings.noise ..
                                        "&noisew=" ..
                                            settings.noisew ..
                                                "&length=" ..
                                                    settings.length ..
                                                        "&format=" ..
                                                            settings.format .. "]"
            end
        end
    else
        return
    end
end

-------------------------------------------------
-- 说(.*)
-- 支持加空格.
-------------------------------------------------
function doSpeaker(msg)
    local p, b

    settings.noise = ReadIni(confPath, "UserConfig", "noise")
    settings.noisew = ReadIni(confPath, "UserConfig", "noisew")
    settings.length = ReadIni(confPath, "UserConfig", "length")
    settings.format = ReadIni(confPath, "UserConfig", "format")

    for i = 1, #npcList do
        p, b = string.find(msg.fromMsg, npcList[i])
        if p or b then
            break
        end
    end
    if p or b then
        return "[CQ:record,file=http://233366.proxy.nscc-gz.cn:8888?speaker=" ..
            string.sub(msg.fromMsg, p, b) ..
                "&text=" ..
                    string.sub(msg.fromMsg, #"说" + 1) ..
                        "&noise=" ..
                            settings.noise ..
                                "&noisew=" ..
                                    settings.noisew ..
                                        "&length=" ..
                                            settings.length ..
                                                "&format=" ..
                                                    settings.format .. "]"
    else
        return "[CQ:record,file=http://233366.proxy.nscc-gz.cn:8888?speaker=神里绫华&text=" ..
            spaceKiller(string.sub(msg.fromMsg, #"说" + 1)) ..
                "&noise=" ..
                    settings.noise ..
                        "&noisew=" ..
                            settings.noisew ..
                                "&length=" ..
                                    settings.length ..
                                        "&format=" ..
                                            settings.format .. "]"
    end
end
```

### VI.
```lua title="ini配置函数"
-------------------------------------------------
-- 配置指令
-- @.GItts <arg>
-- 指令头不分大小写,后面的参数严格区分大小写.
-------------------------------------------------
function GItts(msg)
    command = string.split(msg.fromMsg, " ")

    settings.noise = ReadIni(confPath, "UserConfig", "noise")
    settings.noisew = ReadIni(confPath, "UserConfig", "noisew")
    settings.length = ReadIni(confPath, "UserConfig", "length")
    settings.format = ReadIni(confPath, "UserConfig", "format")

    if command[2] == "reload" then
        setUserConf(getDiceQQ(), "GI_tts", false)
        eventMsg(".system load", 0, msg.fromQQ)
    elseif command[2] == "ini" then
        items = string.split(msg.fromMsg, " ")
        if #items == 2 then
            return read_file(confPath)
        elseif items[3] == "set" then
            WriteIni(confPath, items[4], items[5], items[6])
            return "节点" .. items[4] .. "的key:" .. items[5] .. "值已修改为" .. items[6]
        end
    elseif checkChinese(msg.fromMsg) then
        local npc = ReadIni(confPath, "UserConfig", "DefaultNpc")
        if npc == "*" then
            npc = npcList[ranint(1, #npcList)]
        end
        return "[CQ:record,file=http://233366.proxy.nscc-gz.cn:8888?speaker=" ..
            npc ..
                "&text=" ..
                    spaceKiller(string.sub(msg.fromMsg, #".GItts " + 1)) ..
                        "_&noise=" ..
                            settings.noise ..
                                "&noisew=" ..
                                    settings.noisew ..
                                        "&length=" ..
                                            settings.length ..
                                                "&format=" ..
                                                    settings.format .. "]"
    elseif command[2] == "npcList" then
        return table.list(npcList)
    else
        return [[
		原神tts·GItts
			【.GItts reload】重新配置ini文件并重载
			【.GItts ini (set) (section) (key) (value)】ini配置文件操作
			【.GItts (文本)】调用key:DefaultNpc说一句话
			【.GItts whiteList (add|remove|clr) (word1[,word2[,word3]...])】添加语句白名单
			【.GItts npcList】查看可以使用的人物]]
            
    end
end
```