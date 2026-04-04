# Spellcast programming language
All magic is a Weave, it flows, adjust and act. To create your own powerful spell you need to know its language.
## Spell writing
- Spell is a script
- Each line is casting another spell
### Arithmetic
- binary `+`, `-`
## Bitwise
-  binary `&`
## comparison
- `==`
- result is int32 - 1 for true and 0 for false

### Spell slots (Variables)
- only `int32`
- named starting with `#`

### Magic Flow
- Magic can be whrilled in a loop. 
    ```
    whirl (#row in [0, 64)) (#col in [0, 64)) {
        <code>
    }
    ```
- Magic can be infinetely redirected with a portal
    ```
    portal {
        <code>
    } 
    ```
- Magic can be conditional
    ```
    wonder <cond> {
        <code>
    }
    ```
    

## Basic spells
- this spell writing system includes school of illusion with several space
	- there is an image that can be constructed and displayed. It consists of 64x64 minor images (pixels)
	- `minor_image <row> <col> <color>` - put pixel of color `<color>` at `<row>` `<col>` position
	- `illusion` to display constructed illusion (flush)
- there is an additional magic storage for 64x64 slots 
	- spell `crave <i> <col> <val>` to store value `val` at position `row` `col`
	- spell `detect <i> <row <col>` to get value stored at position `row` `col`
- a special spell to reduce amount of branching (ternary operator basicly) `focus <cond> <iftrue> <iffalse>`