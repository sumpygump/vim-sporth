if exists("b:current_syntax")
    finish
endif

syntax keyword  loop times to while

" Operator ugens
syntax match sporthOperator "\v*"
syntax match sporthOperator "\v\+"
syntax match sporthOperator "\v\-"
syntax match sporthOperator "\v\/"
syntax match sporthOperator "\v\["
syntax match sporthOperator "\v\]"
syntax match sporthOperator "\v\&"
syntax match sporthOperator "\v\|"
syntax match sporthOperator "\v\^"
syntax match sporthOperator "\v\<\<"
syntax match sporthOperator "\v\>\>"
syntax match sporthOperator "\v\%"

" Ugens
syntax keyword sporthUgens abs allpass atone autowah add ampdb bal biscale bitcrush blsaw blsquare bltriangle bpm2dur bpm2rate brown butbp butbr buthp butlp cdb cdbload cdbtab cf changed clip comb conv count crossfade dcblk delay diode diskin dist div drip drop dur durs edo eq eqfil eval f fl fli fc fe floor fm fof fofilt fog fosc frac ftsum gbuzz gen_eval gen_file gen_line gen_padsynth gen_sine gen_rand gen_composite gen_sinesum gen_sporth gen_vals get gt hilbert in incr inv jcrev jitter limit load sdelay slice slist sqrt loadfile loadfile2 loadspa log log10 lpc lpcsynth lpf18 lsys lt max mincer min mix mode moogladder mtof mul ne noise nsmp oscmorph4 oscmorph2 p palias pan panst pareq paulstretch pdhalf peaklim phaser phasor pinknoise pluck port pos print ps pset psh pshift pst ptrack rand randh randi ref render reson reverse revsc rms round rpt rspline samphold saturator saw say scale scrambler set setdurs sget sine smoothdelay slick spa sparec square sr srand sub streson talias talkbox tbldur tblsize tin tone tphasor tport tprop triangle tri tseg var varset vdelay voc vocoder waveset writecode wpkorg35 zeros zitarev zrev

" Stack operators
syntax keyword sporthUgenStack dup dup2 swap rot

" Triggers
syntax keyword sporthUgenTrig expon line maygate maytrig switch tadsr tblrec tdiv tenv tenv2 tenvx tgate timer tog trand tseq

" Generate triggers
syntax keyword sporthUgenTrig metro dmetro clock prop dtrig dust tick

" Gates
syntax keyword sporthUgenGate adsr branch thresh

" Gens that use f-tables
syntax keyword sporthUgenFtables osc tabread tget tset posc3

" Comments
syntax match sporthComment "\v#.*$"

" Variables/strings
syntax region sporthString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region sporthString start=/\v'/ skip=/\v\\./ end=/\v'/
syntax match sporthVariable /_[A-Za-z0-9.]\+/

" Number
syn match sporthNumber /[0-9]\+\(\.[0-9]\+\)\?/

" Invalid
syn match sporthInvalid skipwhite /[A-Z]\+/

" Parens
syntax match sporthSpecial "\v\("
syntax match sporthSpecial "\v\)"

highlight link sporthOperator Operator
highlight link sporthUgenStack Operator
highlight link sporthUgenTrig Function
highlight link sporthUgenGate Function
highlight link sporthUgenFtables Function
highlight link sporthUgens Function
highlight link sporthComment Comment
highlight link sporthString String
highlight link sporthNumber Number
highlight link sporthVariable Constant
highlight link sporthInvalid WarningMsg
highlight link sporthSpecial SpecialKey

let b:current_syntax = "sporth"
