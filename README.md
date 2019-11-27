# xcb-ext-sprite
XC=BASIC extension for convenient sprite programming. Compatible with XC=BASIC v2.2 or higher. [Click here to learn about XC=BASIC](https://xc-basic.net)

# Usage

Include the file `xcb-ext-sprite.bas` in the top of your program:

    include "path/to/xcb-ext-sprite.bas"
    
That's it, you can now use all the symbols defined by this extension. Avoid naming collisions by not defining symbols starting with `spr_` in your program. 

# Examples

Please refer to the file `examples/example.bas`.

# Symbols defined by this extension

## Commands

*Note: sprites are numbered from 0 to 7.*

	proc spr_enable(spr_no!)		'Turns on sprite
	proc spr_disable(spr_no!)		'Turns off sprite
	proc spr_setposy(spr_no!, y!)		'Sets y position of sprite
	proc spr_setposx(spr_no!, x)		'Sets x position of sprite
	proc spr_setpos(spr_no!, x, y!)		'Sets both x and y position of sprite
	proc spr_setshape(spr_no!, shape!)	'Sets shape of sprite (shape! = memory location / 64)
	proc spr_setmulti(spr_no!)		'Turns on multicolor mode for sprite
	proc spr_sethires(spr_no!)		'Turns on hires mode for sprite
	proc spr_setcolor(spr_no!, color!)	'Sets sprite color
	proc spr_setdblwidth(spr_no!)		'Sets double width for sprite
	proc spr_cleardblwidth(spr_no!)		'Unsets double width for sprite
	proc spr_setdblheight(spr_no!)		'Sets double height for sprite
	proc spr_cleardblheight(spr_no!)	'Unsets double height for sprite
	proc spr_behindbg(spr_no!)		'Makes sprite appear behind graphics
	proc spr_overbg(spr_no!)		'Makes sprite appear over graphics
	
## Functions

	fun spr_spr_collision!(spr_no!) 	'Returns 1 if sprite collides with another sprite, 0 otherwise
	fun spr_data_collision!(spr_no!) 	'Returns 1 if sprite collides with graphics, 0 otherwise

## Variables

	dim spr_multicolor1! @ SPR_MCOLOR1	'Use this variable to set shared sprite color #1
	dim spr_multicolor2! @ SPR_MCOLOR2	'Use this variable to set shared sprite color #2

## Constants

	const SPR_ENABLE        = $d015 
	const SPR_X_COORD0      = $d000
	const SPR_Y_COORD0      = $d001
	const SPR_X_COORD1      = $d002
	const SPR_Y_COORD1      = $d003
	const SPR_X_COORD2      = $d004
	const SPR_Y_COORD2      = $d005
	const SPR_X_COORD3      = $d006
	const SPR_Y_COORD3      = $d007
	const SPR_X_COORD4      = $d008
	const SPR_Y_COORD4      = $d009
	const SPR_X_COORD5      = $d00a
	const SPR_Y_COORD5      = $d00b
	const SPR_X_COORD6      = $d00c
	const SPR_Y_COORD6      = $d00d
	const SPR_X_COORD7      = $d00e
	const SPR_Y_COORD7      = $d00f
	const SPR_X_COORD_MSB   = $d010
	const SPR_MULTICOLOR    = $d01c
	const SPR_MCOLOR1       = $d025
	const SPR_MCOLOR2       = $d026
	const SPR_EXP_X         = $d01d
	const SPR_EXP_Y         = $d017
	const SPR_DATA_PRIO     = $d01b
	const SPR_SPR_COLL      = $d01e
	const SPR_DATA_COLL     = $d01f
	const SPR_COLOR0        = $d027
	const SPR_COLOR1        = $d028
	const SPR_COLOR2        = $d029
	const SPR_COLOR3        = $d02a
	const SPR_COLOR4        = $d02b
	const SPR_COLOR5        = $d02c
	const SPR_COLOR6        = $d02d
	const SPR_COLOR7        = $d02e
	const SPR_PTR           = $07f8   

