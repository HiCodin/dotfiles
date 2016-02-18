" Info {{{
" Author: HiCodin
" }}}
" Compatible Mode for Vim {{{

set nocompatible 

" }}}
" Vim-Plug Installation {{{

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" }}}
" Plugins {{{ 

call plug#begin('~/.vim/plugged')

" Colorschemes {{{
Plug 'oguzbilgic/sexy-railscasts-theme'
Plug 'chriskempson/base16-vim'
" }}}
" Vim Airline {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}
" NERDTree {{{
Plug 'scrooloose/nerdtree' 
" }}}
" NERDCommenter {{{
Plug 'scrooloose/nerdcommenter'
"}}}
" CtrlP {{{
Plug 'ctrlpvim/ctrlp.vim'
" }}}
" Emmet {{{
Plug 'mattn/emmet-vim'
" }}}
" Tagbar {{{
Plug 'majutsushi/tagbar'
" }}}
" Neocomplete {{{
Plug 'Shougo/neocomplete.vim'
" }}}
" MatchTagAlways {{{
Plug 'Valloric/MatchTagAlways'
" }}}
" Syntastic {{{
Plug 'scrooloose/syntastic'
"}}}
" JS & related libraries {{{
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
"}}}
" Indent Line {{{
Plug 'Yggdroot/indentLine'
"}}}
" Fancy start screen for Vim {{{
Plug 'mhinz/vim-startify'
" }}}
" i3 Syntax {{{
Plug 'PotatoesMaster/i3-vim-syntax'
" }}}

call plug#end()

" }}}

                                      " ----------------------------------------------------------------------- "
                                      "                               Vim Settings                              "
                                      " ----------------------------------------------------------------------- "

" Vim Settings {{{

" -------------------------------- "
"          colorscheme             "
" -------------------------------- "
set background=dark
colorscheme sexy-railscasts
" -------------------------------- "
"            GUI Config            "
" -------------------------------- "
set guioptions-=m
set guioptions-=T
set guioptions-=L " no scrollbar on the left side
set guioptions-=r " no scrollbar on the right side
set t_Co=256

" -------------------------------- "
"        Case Sensitivity          "
" -------------------------------- "

set ignorecase
set smartcase

" -------------------------------- "
"         Backups Config           "
" -------------------------------- " 

set noswapfile
set nobackup
set nowritebackup
set autowriteall

" -------------------------------- "
"         Folding Mapping          "
" -------------------------------- "

set foldmethod=marker
set foldenable
nnoremap <Space> za

" Foldtext for vimrc {{{
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '(' . ( lines_count ) . ')'
  let foldtextstart = strpart('✦' . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(' ', 2 )
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(' ', winwidth(0)-foldtextlength) . foldtextend 
endfunction
set foldtext=NeatFoldText()
" }}}
" Javascript {{{
function! FoldText()
  let line = ' ' . substitute(getline(v:foldstart), '{.*', '{...}', ' ') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '(' . ( lines_count ) . ')'
  let foldchar = matchstr(&fillchars, 'fold:\')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(' ', 2 )
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(' ', winwidth(0)-foldtextlength) . foldtextend . ' '
endfunction
augroup jsfolding
  autocmd!
  autocmd FileType javascript setlocal foldenable|setlocal foldmethod=syntax |setlocal foldtext=FoldText()
augroup END
" }}}
" CSS {{{
function! CSSFoldText()
  let line = substitute(getline(v:foldstart), '{.*', '{...}', ' ') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '(' . ( lines_count ) . ')'
  let foldchar = matchstr(&fillchars, 'fold:\')
  let foldtextstart = strpart(line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(' ', 2 )
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(' ', winwidth(0)-foldtextlength) . foldtextend . ' '
endfunction
augroup ft_css
    au! 
    au Filetype css setlocal foldmethod=marker
    au Filetype css setlocal foldmarker={,}
    au FileType css setlocal foldtext=CSSFoldText()
augroup END
" }}}

" ------------------------------ "
"      Tabs,Indent settings      "
" ------------------------------ "

set expandtab
set wrap
set shiftwidth=4
set tabstop=4 
set autoindent " auto-indent
set smartindent
set smarttab  " use tabs at the start of the line, spaces elsewhere

" ---------------------------------------------- "
"        Making Split Navigation easier          "
"   Use ctrl-[hjkl] to select the active split!  "
" ---------------------------------------------- "

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" ---------------------------------------------- "
"              Auto-Reload Vimrc                 "
" ---------------------------------------------- "

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost .vimrc source % 
augroup END

" --------------------------------- "
"                Misc               "
" --------------------------------- "


" changing leader key
let mapleader = ","

" copy to clipboard
set clipboard=unnamed

" highlight folded text in gui and cterm
hi Folded ctermfg=222 ctermbg=235 guifg=#FFC66D

" hide mode status as well as completion message
set noshowmode
set shortmess-=m
set shortmess+=cWIs

" open vimrc in a new tab
nmap <leader>ev :tabedit $MYVIMRC<CR>  

" Show Matching tags/parens/ ect
set showmatch 

" changing matching parenthesis colors
highlight MatchParen ctermfg=white guifg=red guibg=NONE

" font setting
set guifont=Fira\ Mono\ Medium\ for\ Powerline\ 10
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" opening split windows/panes on the right side
set splitright

" change color and character of vertical split bar
set fillchars=vert:\│
hi VertSplit ctermfg=black ctermbg=NONE

" change SignColumn color
hi SignColumn ctermbg=NONE 

" warning if anything goes over 81 columns
highlight ColorColumn ctermbg=red 
call matchadd('ColorColumn', '\%81v', 100)

" highlight searches
set hlsearch
hi Search ctermfg=black ctermbg=white

" Show next match 
set incsearch
hi IncSearch ctermfg=black ctermbg=white

" blink highlight searches
nnoremap <silent> n n:call HLNext(0.1)<cr>
nnoremap <silent> N N:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

" map dd to blackhole register
nnoremap d "_d
vnoremap d "_d

" change visual mode color
hi Visual ctermbg=white ctermfg=black

" change quickfix window line color
hi LineNr ctermbg=NONE ctermfg=yellow

"  clear cursorline highlight
hi clear CursorLine

" turn off highlight until next search 
nnoremap <silent> <esc><esc>  :noh<cr><esc>

" hide unused buffers
set hidden

" display buffer list and invoke buffer command 
nnoremap <Leader>p :bprev<cr>
nnoremap <Leader>n :bnext<cr>
nnoremap ,b :ls<CR>:b

" move cursor by display lines in wrapped text
nnoremap j gj
nnoremap k gk

" reduce delay when switching modes
set timeoutlen=1000 ttimeoutlen=0

" make a simple 'search' and 'replace' text object.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" always on sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" disable 'beep' sound in vim when pressing ESC
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif
" }}}

                                      " ----------------------------------------------------------------------- "
                                      "                              Plugins Settings                           "
                                      " ----------------------------------------------------------------------- "

" Neocomplete {{{

" ------------------------------------------------- "
"              Settings for Neocomplete             "
" ------------------------------------------------- "
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern= '\*ku\*'
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
hi Pmenu ctermbg=8
hi PmenuSel ctermbg=1
hi PmenuSbar ctermbg=0
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" }}}
" MatchTagAlways {{{

" --------------------------------------------- "
"           Settings for MatchTagAlways         "
" --------------------------------------------- "
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
highlight MatchTag ctermfg=208 guifg=#FF4500

" }}}
" Vim-Airline {{{

" --------------------------------------- "
"         setting for vim-airline         "
" --------------------------------------- "
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline_left_sep = '█▓░'
let g:airline_right_sep = '░▓█'
let g:airline_section_b = ''
let g:airline_section_c = ''
let g:airline_section_x = ''
let g:airline_section_y = airline#section#create_right([' %l:%c'])
let g:airline_section_z = ''
let g:airline_theme='ubaryd'
let g:airline_mode_map = {
       \ '__' : '-',
       \ 'n'  : 'N',
       \ 'i'  : 'I',
       \ 'R'  : 'R',
       \ 'c'  : 'C',
       \ 'v'  : 'V',
       \ 'V'  : 'V',
       \ '' : 'V',
       \ 's'  : 'S',
       \ 'S'  : 'S',
       \ '^S' : 'S',
       \ }

" }}}
" NERDTree {{{

" ------------------------------------ "    
"           NERDTree setting           "
" ------------------------------------ "
nnoremap et :NERDTreeToggle <cr>
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1
let g:NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable=''
let g:NERDTreeDirArrowCollapsible=''
let g:NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=2
let g:NERDTreeHijackNetrw=1
let g:NERDTreeQuitOnOpen=1
nnoremap <leader>f :NERDTreeFind<cr>
" Highlight Files in NERDTree {{{
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

au VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'NONE')
au VimEnter * call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 'NONE')
au VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 'NONE')
au VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 'NONE')
au VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', 'NONE')
au VimEnter * call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', 'NONE')
au VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'NONE')
au VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'NONE')
au VimEnter * call NERDTreeHighlightFile('styl', '219', 'none', 'cyan', 'NONE')
au VimEnter * call NERDTreeHighlightFile('css', '219', 'none', 'cyan', 'NONE')
au VimEnter * call NERDTreeHighlightFile('coffee', '130', 'none', 'red', 'NONE')
au VimEnter * call NERDTreeHighlightFile('js', '208', 'none', '#ffa500', 'NONE')
au VimEnter * call NERDTreeHighlightFile('rb', '196', 'none', '#ffa500', 'NONE')
au VimEnter * call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 'NONE')

" }}}

" }}} 
" Ctrl-P {{{

" ------------------------------------ "
"            Ctrl-P settings           "
" ------------------------------------ "
let g:ctrlp_map = '<leader>l'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0

let g:ctrlp_buffer_func = { 'enter': 'BrightHighlightOn', 'exit':  'BrightHighlightOff', }
function! BrightHighlightOn()
    hi CursorLine ctermbg=NONE ctermfg=red guifg=NONE guibg=NONE
endfunction

function! BrightHighlightOff()
    hi CursorLine ctermbg=NONE ctermfg=red guifg=NONE guibg=NONE
endfunction
hi CtrlPNoEntries ctermfg=white ctermbg=black
" }}}
" Tagbar {{{

" ------------------------------------------ "
"  Tagbar settings with support for PHP/CSS  "
" ------------------------------------------ "
nnoremap <silent> <leader>t :TagbarToggle<cr>
let g:tagbar_width = 30
let g:tagbar_iconchars = ['+', '-']
let g:airline#extensions#tagbar#enabled = 1
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 2
let g:tagbar_autofocus = 1
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }
" }}}
" Emmet {{{

" ------------------------------------------ "
"           Emmet Key Mapping                "
" ------------------------------------------ "
let g:user_emmet_leader_key=','
" }}}
" Syntastic {{{

" ---------------------------------------------- "
"             Setting for Syntastic              "
" ---------------------------------------------- "
nnoremap <leader>e :Errors<cr>
nnoremap <leader>ec :lcl<cr>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs= 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = '●'
let g:syntastic_warning_symbol = '●'
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }
let g:syntastic_stl_format = '%E{✗ : %e}%B{, }%W{❗: %w}'
highlight SyntasticErrorSign ctermfg=196 ctermbg=NONE guifg=red guibg=NONE
highlight SyntasticWarningSign ctermfg=208 ctermbg=NONE guifg=#FF8700 guibg=NONE  

" }}}
" Indent Line {{{
let g:indentLine_color_term = 235
let g:indentLine_color_gui = "#333333"
let g:indentLine_char ='│' 
let g:indentLine_fileTypeExclude = ['vim']
" }}
