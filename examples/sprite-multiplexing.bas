rem little example to show sprite multiplexing
rem with the help of the sprite and rasterinterrupt extensions

include "./libs/xcb-ext-sprite.bas"
include "./libs/xcb-ext-rasterinterrupt.bas"

const SHAPES_START = $2000
const ANIM_SPEED! = 30
dim i! fast
dim f! fast
dim c! fast

rem clear the screen and set border and background colors
memset 1024, 1000, 32
poke 53280, 11
poke 53281, 0
f! = 0
c! = ANIM_SPEED!
ri_isr_count! = 3

rem the 2 rasterinterrupt procedures needed for sprite multiplexing
proc sg1
  for \i! = 0 to 6
    spr_setcolor \i!, \i! + 2
    spr_setposy \i!, 100
  next \i!
endproc

proc sg2
  for \i! = 0 to 6
    spr_setcolor \i!, \i! + 9
    spr_setposy \i!, 180
  next \i!
endproc

rem sprite animation procedure
proc animate
  dec \c!
  if \c! = 0 then
    for \i! = 0 to 6
      spr_setshape \i!, 128 + \f!
    next \i!
    rem neat trick thanks to @neilsf - XORing variable f! (which starts at 0) with 1, switches it back and forth between 0 and 1
    \f! = \f! ^ 1
    \c! = \ANIM_SPEED!    
  endif
endproc

rem load sprites into memory and initialize them
for i! = 0 to 63
  poke SHAPES_START + i!, ghost1![i!]
  poke SHAPES_START + 64 + i!, ghost2![i!]
next i!
spr_multicolor1! = 1
spr_multicolor2! = 0
for i!= 0 to 6
  spr_enable i!
  spr_setmulti i!
  spr_setshape i!, 128
  spr_setpos i!, cast(i!) * 40 + 50, 100
next i!

rem setup rasterinterrupts to draw the 7 sprites twice per frame
ri_set_isr 0, @sg1, 1
ri_set_isr 1, @sg2, 130
ri_set_isr 2, @animate, 250
ri_on

rem wait for a keypress to exit, disable rasterinterrupts, sprites and reset colors
repeat
until inkey!() <> 0
ri_off
for i! = 0 to 6
  spr_disable i!
next i!
poke 53280, 14
poke 53281, 6
print "{CLR}"
end


rem the 2 animation frames of the ghost sprite
data ghost1![] = ~
  $00,$00,$00,$00,$aa,$00,$02,$aa, ~
  $80,$02,$aa,$80,$0a,$aa,$a0,$0a, ~
  $aa,$a0,$29,$69,$68,$29,$69,$68, ~
  $2b,$6b,$68,$2b,$6b,$68,$2a,$aa, ~
  $a8,$2a,$aa,$a8,$2a,$aa,$a8,$2a, ~
  $aa,$a8,$2a,$aa,$a8,$2a,$aa,$a8, ~
  $2a,$aa,$a8,$2a,$aa,$a8,$28,$a2, ~
  $88,$28,$a2,$88,$28,$a2,$88,$84

data ghost2![] = ~
  $00,$00,$00,$00,$aa,$00,$02,$aa, ~
  $80,$02,$aa,$80,$0a,$aa,$a0,$0a, ~
  $aa,$a0,$29,$69,$68,$29,$69,$68, ~
  $29,$e9,$e8,$29,$e9,$e8,$2a,$aa, ~
  $a8,$2a,$aa,$a8,$2a,$aa,$a8,$2a, ~
  $aa,$a8,$2a,$aa,$a8,$2a,$aa,$a8, ~
  $2a,$aa,$a8,$2a,$aa,$a8,$22,$8a, ~
  $28,$22,$8a,$28,$22,$8a,$28,$84
