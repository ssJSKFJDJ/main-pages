---
template: overrides/main.html
---
# Midido ♫

> 一个简单读写 MIDI 文件的 Lua 库

## Module

!!! Info
    - License: MIT.
    - Author: Pedro Alves Valentim

1. [`Midido`](./Midido): Midido的主模块，通过它可以调用Midido库里的所有内容。
2. [`Constants`](./Constants): Midido的常量库。
3. [`Util`](./Util): Midido内关于类的多功能函数库。

## Classes

!!! Tip
    [`ArbitraryEvent`](./ArbitraryEvent)、[`Chunk`](./Chunk)、[`MetaEvent`](./MetaEvent)的对象不需要由用户创建。

1. [`ArbitraryEvent`](./ArbitraryEvent): 提取MIDI中的任意事件。
2. [`Chunk`](./Chunk): 提取MIDI区块。
3. [`MetaEvent`](./MetaEvent): 提取MIDI元事件。
4. [`NoteEvent`](./NoteEvent): 提取MIDI内的Note On与Note Off事件。
5. [`NoteOffEvent`](./NoteOffEvent): 提取MIDI的NoteOff事件。
6. [`NoteOnEvent`](./NoteOnEvent): 提取MIDI的NoteOn事件。
7. [`ProgramChangeEvent`](./ProgramChangeEvent): 提取MIDI程的变化事件。
8. [`Track`](./Track): 包含了MIDI文件内轨道的所有数据。
9. [`Writer`](./Writer): 管理合并所有轨道以及功能输出的方法。
