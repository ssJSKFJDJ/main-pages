---
template: overrides/main.html
categories:
     - Lua
---
# listen2me - wiki ♫

> ## Midido ♫

一个用于读写MIDI文件，且具有十分友好的API的Lua扩库。它提供的MIDI数据是完全抽象的，因此并不需要用户担心那些诸如增量时间(Delta Time)和音符信号(NoteOn/NoteOff)这样的技术问题。它的方法是直观且具体的，同时对象数据也具有良好的可读性。
值得一提的是——这个扩展库不需要 **任何** 依赖。

## Welcome

 欢迎来到wiki页面，这个wiki旨在说明通过 **Midido ♫** 提供的一切方法写出MIDI文件的方法和过程。如果你在这里没有找到如何对自己有帮助的内容，请发布issue，我会尽快回复哦。

## Guide

### Usage

1. 导入主模块:

```lua
local Midido = require ('Midido')
```

2. 完成上步后，所有的类均可使用，以下是如何编写C大调音阶的示例:

```lua
local Midido = require ('Midido')
local Track = Midido.Track
local NoteEvent = Midido.NoteEvent
local Writer = Midido.Writer

-- 创建 Track 实例
local track = Track.new()

-- 将音符存为notes表中的键值(必须指定的八度音阶)
local notes = {'C3', 'D3', 'E3', 'F3', 'G3', 'A3', 'B3', 'C4'}

-- 将音符添加到轨道
track:add_events(NoteEvent.new({pitch = notes, sequential = true}))

-- 遍历轨道
local writer = Writer.new(track)

-- 写一个名为《C Major Scale》的MIDI文件
writer:save_MIDI('C Major Scale')
```

由于代码中已经有一些注释，因此不需要对其再进行解释说明。 这是 MIDI 文件构建的基本步骤。
