" vim-airline companion theme of Ubaryd
" (https://github.com/Donearm/Ubaryd)

" Normal mode
let s:N1 = [ '#141413' , '#c7b386' , 232 , 252 ] " blackestgravel & bleaksand
let s:N2 = [ '#c7b386' , '#45413b' , 252, 238 ] " bleaksand & deepgravel
let s:N3 = [ '#b88853' , '#242321' , 137, 235 ] " toffee & darkgravel
let s:N4 = [ '#857f78' , 243 ] " gravel

" Insert mode
let s:I1 = [ '#1a1a18' , '#fade3e' , 232 , 221 ] " blackestgravel & warmcorn
let s:I2 = [ '#c7b386' , '#45413b' , 252 , 238 ] " bleaksand & deepgravel
let s:I3 = [ '#f4cf86' , '#242321' , 222 , 235 ] " lighttannedskin & darkgravel

" Visual mode
let s:V1 = [ '#eeeeee' , '#9a4820' , 255 , 166 ] " blackgravel & warmadobe
let s:V2 = [ '#000000' , '#88633f' , 16 , 95 ] " coal & cappuccino
let s:V3 = [ '#88633f' , '#c7b386' , 95 , 252 ] " cappuccino & bleaksand
let s:V4 = [ '#c14c3d' , 160 ] " tannedumbrella

" Replace mode
let s:R1 = [ '#eeeeee' , '#9a4820' , 255 , 124 ]

" Paste mode
let s:PA = [ '#f9ef6d' , 154 ] " bleaklemon

let s:IA = [ s:N2[1], s:N3[1], s:N2[3], s:N3[3], '' ]	

let g:airline#themes#ubaryd#palette = {}

let g:airline#themes#ubaryd#palette.accents = {
      \ 'red': [ '#ff7400' , '' , 196 , '' , '' ],
      \ }

let g:airline#themes#ubaryd#palette.inactive = {
      \ 'airline_a' : [ s:N2[1] , s:N3[1] , s:N2[3] , s:N3[3] , '' ] }


let g:airline#themes#ubaryd#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#ubaryd#palette.normal_modified = {
      \ 'airline_a' : [ s:N1[0] , s:N1[1] , s:N1[2] , s:N1[3] , '' ] ,
      \ 'airline_c' : [ s:V1[1] , '' , s:V1[3] , '' , '' ],
      \ 'airline_warning' : [ '#242321' , '#c7b386' , 15 , 124 , '' ] }


let g:airline#themes#ubaryd#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#ubaryd#palette.insert_modified = {
      \ 'airline_c' : [ s:V2[1] , '' , s:V2[3] , '' , '' ],
      \ 'airline_warning' : [ '#242321' , '#c7b386' , 15 , 124 , '' ] }

let g:airline#themes#ubaryd#palette.insert_paste = {
      \ 'airline_a' : [ s:I1[0] , s:PA[0] , s:I1[2] , s:PA[1] , '' ],
      \ 'airline_warning' : [ '#242321' , '#c7b386' , 15 , 124 , '' ] }



let g:airline#themes#ubaryd#palette.replace = airline#themes#generate_color_map(s:R1, s:I2, s:I3)
let g:airline#themes#ubaryd#palette.replace.airline_a = [ s:R1[0] , s:R1[1] , s:R1[2] , s:R1[3] , '' ]
let g:airline#themes#ubaryd#palette.replace_modified = g:airline#themes#ubaryd#palette.insert_modified


let g:airline#themes#ubaryd#palette.visual = airline#themes#generate_color_map(s:V1, s:I2, s:I3)
let g:airline#themes#ubaryd#palette.visual_modified = {
      \ 'airline_c' : [ s:V3[0] , '' , '', '' , '' ],
      \ 'airline_warning' : [ '#242321' , '#c7b386' , 15 , 124 , '' ] }

let g:airline#themes#ubaryd#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#ubaryd#palette.inactive_modified = {
      \ 'airline_c' : [ s:V1[1] , ''      , s:V1[3] , ''      , '' ] }

let g:airline#themes#ubaryd#palette.normal.airline_warning = [ '#242321', '#c7b386', 15, 124]
let g:airline#themes#ubaryd#palette.insert.airline_warning = [ '#242321', '#c7b386', 15, 124 ]
let g:airline#themes#ubaryd#palette.visual.airline_warning = [ '#242321', '#c7b386', 15, 124 ]
let g:airline#themes#ubaryd#palette.replace.airline_warning = [ '#242321', '#c7b386', 15, 124 ]
