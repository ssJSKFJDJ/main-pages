# Summary
- [NoteEvent](#noteevent)
- [ProgramChangeEvent](#programchangeevent)
- [Track](#track)
- [Writer](#writer)
- [LuaMidi](#luamidi)

# NoteEvent

### Description
Arguably, the core of the API. It holds every aspect of a MIDI note "process". I call it *process* because it requires two signals: one to start and another to end the note. There's also the *delta-time*, which is [not an intuitive concept](http://sites.uci.edu/camp2014/2014/05/19/timing-in-midi-files/). So, the NoteEvent class wraps it all and is, therefore, a bridge between an easily readable *note* concept and the MIDI format NoteOn+NoteOff event(s).

### Usage
```lua
-- Creates a simple C note
NoteEvent.new({pitch = 'C4'})
-- Alternatively
NoteEvent.new({pitch = 60})

-- Creates an E5 chord (with default length of a quarter note)
NoteEvent.new({pitch = {'E3', 'B3'}})

-- Creates an A minor chord arpeggio event(s sequence) (with each note lasting an eighth note)
NoteEvent.new({pitch = {'A3', 'C4', 'E4', 'C5', 'E5'}, duration = '8', sequential = true})
```

### Properties
<table>
    <thead>
        <tr align="center">
            <th>Name</th>
            <th>Type</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><b>pitch</b></td>
            <td>string, number or array</td>
            <td>Note (or array of notes) to be triggered. Can be a string or valid MIDI note code.  Format for string is <code>C#4</code>.</td>
        </tr>
        <tr bgcolor="#dddddd">
            <td><b>duration</b></td>
            <td>string or array</td>
            <td>
                How long the note should sound.
                <ul>
                    <li><code>1</code>  : whole</li>
                    <li><code>2</code>  : half</li>
                    <li><code>d2</code> : dotted half</li>
                    <li><code>4</code>  : quarter</li>
                    <li><code>d4</code> : dotted quarter</li>
                    <li><code>8</code>  : eighth</li>
                    <li><code>8t</code> : eighth triplet</li>
                    <li><code>d8</code> : dotted eighth</li>
                    <li><code>16</code> : sixteenth</li>
                    <li><code>Tn</code> : where n is an explicit number of ticks</li>
                </ul>
                If an array of durations is passed then the sum of the durations will be used.
            </td>
        </tr>
        <tr>
            <td><b>rest</b></td>
            <td>string</td>
            <td>Rest before sounding note.  Takes same values as <b>duration</b>.</td>
        </tr>
        <tr bgcolor="#dddddd">
          <td><b>velocity</b></td>
            <td>number</td>
            <td>How loud the note should sound, values 1-100.  Default: <code>50</code></td>
        </tr>
        <tr>
            <td><b>sequential</b></td>
            <td>boolean</td>
            <td>If true then array of pitches will be played sequentially as opposed to simulatanously.  Default: <code>false</code></td>
        </tr>
        <tr bgcolor="#dddddd">
            <td><b>repetition</b></td>
            <td>number</td>
            <td>How many times this event should be repeated. Default: <code>1</code></td>
        </tr>
        <tr>
            <td><b>channel</b></td>
            <td>number</td>
            <td>MIDI channel to use. Default: <code>1</code></td>
        </tr>
    </tbody>
</table>

### Methods
<table>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:new">NoteEvent:new (fields)</a></td>
	<td class="summary">Creates a new NoteEvent.</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:print">NoteEvent:print ()</a></td>
	<td class="summary">Prints event's data in a human-friendly style</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:set_pitch">NoteEvent:set_pitch (pitch)</a></td>
	<td class="summary">Sets NoteEvent's pitch</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:set_duration">NoteEvent:set_duration (duration)</a></td>
	<td class="summary">Sets NoteEvent's duration</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:set_rest">NoteEvent:set_rest (rest)</a></td>
	<td class="summary">Sets NoteEvent's rest</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:set_velocity">NoteEvent:set_velocity (velocity)</a></td>
	<td class="summary">Sets NoteEvent's velocity</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:set_sequential">NoteEvent:set_sequential (sequential)</a></td>
	<td class="summary">Sets NoteEvent's sequential property</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:set_repetition">NoteEvent:set_repetition (repetition)</a></td>
	<td class="summary">Sets NoteEvent's repetition</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:set_channel">NoteEvent:set_channel (channel)</a></td>
	<td class="summary">Sets NoteEvent's channel</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:get_pitch">NoteEvent:get_pitch ()</a></td>
	<td class="summary">Gets pitch(es) of NoteEvent</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:get_duration">NoteEvent:get_duration ()</a></td>
	<td class="summary">Gets duration of NoteEvent</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:get_rest">NoteEvent:get_rest ()</a></td>
	<td class="summary">Gets rest duration of NoteEvent</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:get_velocity">NoteEvent:get_velocity ()</a></td>
	<td class="summary">Gets velocity of NoteEvent</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:get_sequential">NoteEvent:get_sequential ()</a></td>
	<td class="summary">Gets sequentiallity of NoteEvent</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:get_repetition">NoteEvent:get_repetition ()</a></td>
	<td class="summary">Gets repetition value of NoteEvent</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/NoteEvent.html#NoteEvent:get_channel">NoteEvent:get_channel ()</a></td>
	<td class="summary">Gets channel # of NoteEvent</td>
	</tr>
</table>

### External links
- https://www.noterepeat.com/articles/how-to/213-midi-basics-common-terms-explained#F
- https://www.cs.cmu.edu/~music/cmsip/readings/MIDI%20tutorial%20for%20programmers.html
- http://entertainment.howstuffworks.com/midi1.htm
- http://www.homerecordinghub.com/midi.html
- http://midi.teragonaudio.com/tutr/notenum.htm
- http://midi.teragonaudio.com/tech/midispec/noteon.htm
- http://midi.teragonaudio.com/tech/midispec/noteoff.htm

# ProgramChangeEvent

### Description
A ProgramChangeEvent makes it possible to change the "program" of a channel, which is, for the first 15 channels and most of MIDI devices, changing the *instrument sound*. This event is mostly the same as the raw MIDI data. That's due to the fact that this is one of the shortest events, being just 2 bytes long.

### Usage
```lua
-- Sets the instrument sound or "program" to #25, which is usually the Nylon Guitar
ProgramChangeEvent.new(25)
```

### Properties
| Name     | Type   | Description                      |
|----------|--------|----------------------------------|
| pcnumber | number | a valid MIDI patch change number |

### Methods
<table>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/ProgramChangeEvent.html#ProgramChangeEvent:new">ProgramChangeEvent:new (pcnumber)</a></td>
	<td class="summary">Creates a new ProgramChangeEvent to change the
 track's instrument</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/ProgramChangeEvent.html#ProgramChangeEvent:print">ProgramChangeEvent:print ()</a></td>
	<td class="summary">Prints event's data in a human-friendly style</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/ProgramChangeEvent.html#ProgramChangeEvent:set_value">ProgramChangeEvent:set_value (value)</a></td>
	<td class="summary">Sets ProgramChangeEvent's value</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/ProgramChangeEvent.html#ProgramChangeEvent:get_value">ProgramChangeEvent:get_value ()</a></td>
	<td class="summary">Gets ProgramChangeEvent's value</td>
	</tr>
</table>

### External links
- https://en.wikipedia.org/wiki/General_MIDI#Program_change_events
- http://midi.teragonaudio.com/tech/midispec/pgm.htm
- http://midi.teragonaudio.com/tech/midispec.htm
- https://www.noterepeat.com/articles/how-to/213-midi-basics-common-terms-explained#H

# Track

### Description
An abstraction to represent a MIDI track. It comprises the events (Note, Meta and ProgramChange) and handles it's own setup data, as its header (MTrk) and its [meta-event ending](http://www.recordingblogs.com/sa/Wiki/topic/MIDI-End-of-Track-meta-message). Because MIDI meta events are always tied to tracks, **LuaMidi ♫** doesn't expect the user to directly create MetaEvents (which *is* an API class) objects, but to use Track's methods instead. These methods manage to create these objects and configure them.

### Usage
```lua
-- Creates a new Track
Track.new()

-- Creates a new Track with a "name" meta event (set as "Track1")
local trk = Track.new("Track1")

-- Adds a NoteEvent to the Track
trk:add_events(NoteEvent.new({pitch='C4'}))

-- Adds a ProgramChangeEvent and adds a MetaEvent to describe which instrument it is supposed to be
trk:add_events(ProgramChangeEvent.new(25)):set_instrument_name("Nylon Guitar")
```

### Properties
| Name     | Type  | Description                                   |
|----------|-------|-----------------------------------------------|
| data     | array | events' binary data to be built by the Writer |
| size     | array | binary data size to be built by the Writer    |
| events   | array | events' objects                               |
| metadata | array | readable metadata                             |

### Methods
<table>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:new">Track:new ([name])</a></td>
	<td class="summary">Creates a new Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:add_events">Track:add_events (events, map_function)</a></td>
	<td class="summary">Adds an event-list (or single event) to the track.</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:get_events">Track:get_events (filter)</a></td>
	<td class="summary">Gets events from Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:set_tempo">Track:set_tempo (bpm)</a></td>
	<td class="summary">Sets Track's tempo</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:set_time_signature">Track:set_time_signature (num, den[, midi_clocks_tick=<code>24</code>[, notes_midi_clock=<code>8</code>]])</a></td>
	<td class="summary">Sets Track's time signature</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:set_key_signature">Track:set_key_signature (sf, mi)</a></td>
	<td class="summary">Sets Track's key signature</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:set_text">Track:set_text (text)</a></td>
	<td class="summary">Sets text to Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:set_copyright">Track:set_copyright (copyright)</a></td>
	<td class="summary">Sets copyright to Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:set_name">Track:set_name (name)</a></td>
	<td class="summary">Sets a name to Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:set_instrument_name">Track:set_instrument_name (instrument_name)</a></td>
	<td class="summary">Sets instrument name to Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:set_lyric">Track:set_lyric (lyric)</a></td>
	<td class="summary">Sets lyric to Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:set_marker">Track:set_marker (marker)</a></td>
	<td class="summary">Sets marker text to Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:set_cue_point">Track:set_cue_point (cue_point)</a></td>
	<td class="summary">Sets cue point to Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:poly_mode_on">Track:poly_mode_on ()</a></td>
	<td class="summary">Activates poly mode</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:get_text">Track:get_text ()</a></td>
	<td class="summary">Gets text from Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:get_copyright">Track:get_copyright ()</a></td>
	<td class="summary">Gets copyright from Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:get_name">Track:get_name ()</a></td>
	<td class="summary">Gets name from Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:get_instrument_name">Track:get_instrument_name ()</a></td>
	<td class="summary">Gets instrument name from Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:get_lyric">Track:get_lyric ()</a></td>
	<td class="summary">Gets lyric from Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:get_marker">Track:get_marker ()</a></td>
	<td class="summary">Gets marker from Track</td>
	</tr>
	<tr>
	<td class="name" nowrap><a href="https://pedroalvesv.github.io/LuaMidi/classes/Track.html#Track:get_cue_point">Track:get_cue_point ()</a></td>
	<td class="summary">Gets cue point from Track</td>
	</tr>
</table>

### External links
- http://www.somascape.org/midi/tech/mfile.html#mtrk
- http://www.homerecordinghub.com/midi-channels.html
- http://www.somascape.org/midi/tech/mfile.html#meta

# Writer

### Description

### Properties

### Methods

# LuaMidi

### Description

### Properties

### Methods
