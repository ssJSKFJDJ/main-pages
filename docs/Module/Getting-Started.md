**LuaMidi ♫** is an attempt to abstract the MIDI format (more precisely, the Standard MIDI Format) and offer the user an object-oriented-like control of its events. The API is as clearer and complete as (I could make) possible.

## Installation

To install **LuaMidi ♫**, use [LuaRocks](https://github.com/luarocks/luarocks):

```
$ luarocks install luamidi
```

## Usage

Initially, it must import the main module:

```lua
local LuaMidi = require ('LuaMidi')
```

Once it's been done, all classes are available.  
Here is an example of how to write the C Major Scale:

```lua
local LuaMidi = require ('LuaMidi')
local Track = LuaMidi.Track
local NoteEvent = LuaMidi.NoteEvent
local Writer = LuaMidi.Writer

-- Creates Track instance
local track = Track.new()

-- Table with notes as strings (must specify octave)
local notes = {'C3', 'D3', 'E3', 'F3', 'G3', 'A3', 'B3', 'C4'}

-- Adds notes to Track
track:add_events(NoteEvent.new({pitch = notes, sequential = true}))

-- Creates Writer passing Track
local writer = Writer.new(track)

-- Writes MIDI file called "C Major Scale.mid"
writer:save_MIDI('C Major Scale')
```

As there's already an inline explanation in the code, it's not needed to make a narrative out of it. That's the basic routine of a MIDI file construction. A more complex example can be seen at [[Writing Stairway to Heaven]].  
For further explanation about it, check the [[Classes]] page.