10 print"{clr}{down}{wht}"
15 poke53281,2:poke53280,10
20 dimp$(3):fori=1to3:readp$(i):next
30 fori=1to3:print str$(i);". ";p$(i):next
130 getg$:x=val(g$):ifg$<>"0"andx=0then130
140 ifg$="0"then print"{clr}":end
150 print"{clr}{down}{down}{down}load"chr$(34);p$(x);chr$(34);",8"
200 print"{down}{down}{down}{down}run"
210 poke198,2:poke631,13:poke632,13
230 print"{home}{blk}":new
1000 data"bubble escape 2k.prg","bubble escape.prg","disksumo"
