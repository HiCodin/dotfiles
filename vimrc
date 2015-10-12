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
Plug 'oguzbilgic/sexy-railscasts-theme' "colorscheme : sexy-railscasts-theme
Plug 'chriskempson/base16-vim' "colorscheme : base16 family
" }}}
" Vim Airline {{{
Plug 'bling/vim-airline'
" }}}
" NERDTree {{{
Plug 'scrooloose/nerdtree' 
" }}}
" NERDCommenter {{{
Plug 'scrooloose/nerdcommenter'
"}}}
" CtrlP {{{
Plug 'kien/ctrlp.vim'
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
" Javascript & related libraries {{{
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
"}}}
" Indent Line {{{
Plug 'Yggdroot/indentLine'
"}}}
call plug#end()

" }}}

                                 " ----------------------------------------------------------------------- "
                                 "                            Vim Configurations                           "
                                 " ----------------------------------------------------------------------- "

" Vim Settings {{{

" -------------------------------- "
"          colorscheme             "
" -------------------------------- "

if has('gui_running')
    colorscheme sexy-railscasts
else 
    colorscheme base16-default
endif

" -------------------------------- "
"            GUI Config            "
" -------------------------------- "
set guioptions-=m
set guioptions-=T
set guioptions-=L " no scrollbar on the left side
set guioptions-=r " no scrollbar on the right side

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
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '(' . ( lines_count ) . ')'
  let foldtextstart = strpart('+' . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(' ', 4 )
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(' ', winwidth(0)-foldtextlength) . foldtextend 
endfunction
set foldtext=NeatFoldText()

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
"     Switch between Previours/Next Buffers      "
" ---------------------------------------------- "

map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

" ---------------------------------------------- "
"              Auto-Reload Vimrc                 "
" ---------------------------------------------- "

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost .vimrc source % 
augroup END

" ------------------------------------------------ "
" setting for cursor in command mode / insert mode "
" ------------------------------------------------ "

set guicursor+=n:hor10-Cursor/lCursor 
set guicursor+=i:hor10-Cursor/lCursor 
set guicursor+=a:blinkon0

" --------------------------------- "
"                Misc               "
" --------------------------------- "


" changing leader key
let mapleader = ","

" copy to clipboard
set clipboard=unnamed

" highlight comment in cterm
hi Comment ctermfg=white

" highlight folded text in gui and cterm
hi Folded ctermfg=222 guifg=#FFC66D

" setting for vim default window size
set lines=40 columns=150 

" hide mode status as well as completion message
set noshowmode

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

" show line numbers
set number

" highlight current line number
set cursorline
hi clear CursorLine
hi CursorLineNR ctermfg=222 guifg=#FFC66D

" warning if anything goes over 81 columns
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" highlight searches
set hlsearch

" do highlight for the search 
set incsearch  

" turn off highlight until next search 
nnoremap <silent> <esc> :noh<cr><esc>

" hide unused buffers
set hidden

" display buffer list and invoke buffer command 
nnoremap ,b :ls<CR>:b

" move cursor by display lines in wrapped text
nnoremap j gj
nnoremap k gk

" }}}
                                 
                                 " ----------------------------------------------------------------------- "
                                 "                          Plugins Configurations                         "
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
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_theme='ubaryd'
let g:airline_mode_map = {
       \ '__' : '-',
       \ 'n'  : 'N',
       \ 'i'  : 'I',
       \ 'R'  : 'R',
       \ 'c'  : 'C',
       \ 'v'  : 'V',
       \ 'V'  : 'V',
       \ '^V' : 'V',
       \ 's'  : 'S',
       \ 'S'  : 'S',
       \ '^S' : 'S',
       \ }

" }}}
" NERDTree {{{

" ------------------------------------ "    
"           NERDTree setting           "
" ------------------------------------ "
nnoremap nt :NERDTreeToggle <cr>
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1
let NERDTreeDirArrows=0
let g:NERDTreeMinimalUI=1
let g:NERDTreeChDirMode=2
let g:NERDTreeHijackNetrw=1
let NERDTreeQuitOnOpen=1
nnoremap <leader>f :NERDTreeFind<cr>

" }}} 
" Ctrl-P {{{

" ------------------------------------ "
"            Ctrl-P settings           "
" ------------------------------------ "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0

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
" GTFO {{{

" -------------------------------------------------------- "
"   Setting for GTFO aka Go to Terminal or File manager    "
" -------------------------------------------------------- "
let g:gtfo#terminals = { 'mac' : 'iterm' }
" }}}
" Syntastic {{{

" ---------------------------------------------- "
"             Setting for Syntastic              "
" ---------------------------------------------- "
nnoremap <leader>e :Errors<cr>
nnoremap <leader>ec :lcl<cr>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs=1
let g:syntastic_loc_list_height=3
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }
" }}}
" Javascript {{{
function! FoldText()
  let line = ' ' . substitute(getline(v:foldstart), '{.*', '{...}', ' ') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '(' . ( lines_count ) . ')'
  let foldchar = matchstr(&fillchars, 'fold:\')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(' ', 6 )
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
  let foldtextend = lines_count_text . repeat(' ', 6 )
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
" Indent Line {{{
let g:indentLine_color_term = 236
let g:indentLine_color_gui = "#333333"
let g:indentLine_char ='' 
let g:indentLine_fileTypeExclude = ['vim']
" }}}
