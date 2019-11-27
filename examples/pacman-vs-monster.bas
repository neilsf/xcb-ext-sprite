rem *********************
rem * XC=BASIC
rem *
rem * A very stupid
rem * example program for
rem * sprite extension
rem *********************

include "../xcb-ext-sprite.bas"

CONST SHAPES_START = $2000
CONST RASTER_LINE  = $d012

rem Copy sprite data to shape locations
for i! = 0 to 63
  poke SHAPES_START + i!, pacman1![i!]
  poke SHAPES_START + 64 + i!, pacman2![i!]
  poke SHAPES_START + 128 + i!, pacman3![i!]
  poke SHAPES_START + 192 + i!, pacman4![i!]
  poke SHAPES_START + 256 + i!, monster1![i!]
  poke SHAPES_START + 320 + i!, monster2![i!]
  poke SHAPES_START + 384 + i!, monster3![i!]
  poke SHAPES_START + 448 + i!, monster4![i!]
next i!

rem set up sprites
spr_setdblheight 0 : spr_setdblheight 1
spr_setdblwidth 0 : spr_setdblwidth 1
spr_setmulti 0 : spr_setmulti 1
spr_setcolor 0, 7
spr_setcolor 1, 1
spr_multicolor1! = 10
spr_multicolor2! = 0
spr_setshape 0, 128
spr_setshape 1, 132

rem Init variables
pacman_x  = 40
pacman_y! = 140
monster_x  = 280
monster_y! = 144
pacman_shape!  = 0
monster_shape! = 0

spr_setpos 0, pacman_x, pacman_y!
spr_setpos 1, monster_x, monster_y!

spr_enable 0 : spr_enable 1

animphase = 0
animdir = 1
pos = 40

rem -- read current collision state to
rem -- reset register
collide! = spr_spr_collision!(0)

repeat
  for j! = 1 to 2
    watch RASTER_LINE, 250
  next j!
  spr_setposx 0, pos
  spr_setposx 1, 320-pos
  inc pos
  inc pos
  animphase = animphase + animdir
  if animphase = 3 then animdir = -1
  if animphase = 0 then animdir = 1
  spr_setshape 0, 128 + animphase
  spr_setshape 1, 132 + animphase
  collide! = spr_spr_collision!(0)
until collide! = 1

end

; Sprite #1
; Multicolor mode, BG color: 6, Sprite color: 7, multicolor1: 10, multicolor2: 1
data pacman1![] = ~
	$01, $00, $00, ~
	$01, $00, $00, ~
	$05, $00, $00, ~
	$05, $00, $00, ~
	$14, $14, $00, ~
	$14, $54, $00, ~
	$51, $5A, $00, ~
	$51, $6A, $80, ~
	$01, $6A, $A0, ~
	$05, $A8, $A0, ~
	$05, $A8, $A8, ~
	$16, $AA, $A8, ~
	$1A, $AA, $A8, ~
	$0A, $A8, $00, ~
	$0A, $AA, $A8, ~
	$0A, $AA, $A8, ~
	$0A, $AA, $A8, ~
	$02, $AA, $A0, ~
	$02, $AA, $A0, ~
	$00, $AA, $80, ~
	$00, $2A, $00

; Sprite #2
; Multicolor mode, BG color: 6, Sprite color: 7, multicolor1: 10, multicolor2: 6
data pacman2![] = ~
	$01, $00, $00, ~
	$01, $00, $00, ~
	$05, $00, $00, ~
	$05, $00, $00, ~
	$14, $14, $00, ~
	$14, $54, $00, ~
	$51, $5A, $00, ~
	$51, $6A, $80, ~
	$01, $6A, $A0, ~
	$05, $A8, $A0, ~
	$05, $A8, $A8, ~
	$16, $AA, $A0, ~
	$1A, $AA, $00, ~
	$0A, $A8, $00, ~
	$0A, $AA, $00, ~
	$0A, $AA, $A0, ~
	$0A, $AA, $A8, ~
	$02, $AA, $A0, ~
	$02, $AA, $A0, ~
	$00, $AA, $80, ~
	$00, $2A, $00

; Sprite #3
; Multicolor mode, BG color: 6, Sprite color: 7, multicolor1: 10, multicolor2: 6
data pacman3![] = ~
	$01, $00, $00, ~
	$01, $00, $00, ~
	$05, $00, $00, ~
	$05, $00, $00, ~
	$14, $14, $00, ~
	$14, $54, $00, ~
	$51, $5A, $00, ~
	$51, $6A, $80, ~
	$01, $6A, $A0, ~
	$05, $A2, $A8, ~
	$05, $A2, $A0, ~
	$16, $AA, $80, ~
	$1A, $AA, $00, ~
	$0A, $A8, $00, ~
	$0A, $AA, $00, ~
	$0A, $AA, $80, ~
	$0A, $AA, $A0, ~
	$02, $AA, $A8, ~
	$02, $AA, $A0, ~
	$00, $AA, $80, ~
	$00, $2A, $00

; Sprite #4
; Multicolor mode, BG color: 6, Sprite color: 7, multicolor1: 10, multicolor2: 6
data pacman4![] = ~
	$01, $00, $00, ~
	$01, $00, $00, ~
	$05, $00, $00, ~
	$05, $00, $00, ~
	$14, $14, $00, ~
	$14, $54, $00, ~
	$51, $5A, $00, ~
	$51, $6A, $A0, ~
	$01, $6A, $A0, ~
	$05, $A2, $80, ~
	$05, $A2, $80, ~
	$16, $AA, $00, ~
	$1A, $A8, $00, ~
	$0A, $A0, $00, ~
	$0A, $A8, $00, ~
	$0A, $AA, $00, ~
	$0A, $AA, $80, ~
	$02, $AA, $80, ~
	$02, $AA, $A0, ~
	$00, $AA, $A0, ~
	$00, $2A, $00

; Sprite #5
; Multicolor mode, BG color: 6, Sprite color: 1, multicolor1: 10, multicolor2: 0
data monster1![] = ~
	$05, $55, $40, ~
	$15, $55, $50, ~
	$15, $55, $50, ~
	$55, $55, $54, ~
	$55, $A9, $A8, ~
	$55, $BD, $BC, ~
	$55, $BD, $BC, ~
	$55, $BD, $BC, ~
	$55, $A9, $A8, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$44, $44, $44, ~
	$44, $44, $44

; Sprite #6
; Multicolor mode, BG color: 6, Sprite color: 1, multicolor1: 10, multicolor2: 0
data monster2![] = ~
	$05, $55, $40, ~
	$15, $55, $50, ~
	$15, $55, $50, ~
	$55, $55, $54, ~
	$56, $A6, $A4, ~
	$56, $F6, $F4, ~
	$56, $F6, $F4, ~
	$56, $F6, $F4, ~
	$56, $A6, $A4, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$11, $11, $10, ~
	$11, $11, $10

; Sprite #7
; Multicolor mode, BG color: 6, Sprite color: 1, multicolor1: 10, multicolor2: 0
data monster3![] = ~
	$05, $55, $40, ~
	$15, $55, $50, ~
	$15, $55, $50, ~
	$55, $55, $54, ~
	$6A, $6A, $54, ~
	$7E, $7E, $54, ~
	$7E, $7E, $54, ~
	$7E, $7E, $54, ~
	$6A, $6A, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$44, $44, $44, ~
	$44, $44, $44

; Sprite #8
; Multicolor mode, BG color: 6, Sprite color: 1, multicolor1: 10, multicolor2: 0
data monster4![] = ~
	$05, $55, $40, ~
	$15, $55, $50, ~
	$15, $55, $50, ~
	$55, $55, $54, ~
	$A9, $A9, $54, ~
	$F9, $F9, $54, ~
	$F9, $F9, $54, ~
	$F9, $F9, $54, ~
	$A9, $A9, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$55, $55, $54, ~
	$11, $11, $10, ~
	$11, $11, $10
