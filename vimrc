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

" Color Scheme {{{
Plug 'oguzbilgic/sexy-railscasts-theme'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'alessandroyorba/despacio'
Plug 'alessandroyorba/sierra'
" }}}
" NERDTree {{{
Plug 'scrooloose/nerdtree' 
" }}}
" NERDCommenter {{{
Plug 'scrooloose/nerdcommenter'
"}}}
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
Plug 'posva/vim-vue'
Plug 'moll/vim-node'
"}}}
" PHP {{{
Plug 'shawncplus/phpcomplete.vim'
Plug 'jwalton512/vim-blade'
"}}}
" TOML {{{
Plug 'cespare/vim-toml'
"}}}
" Ruby {{{
Plug 'vim-ruby/vim-ruby'
"}}}
" Fancy start screen for Vim {{{
Plug 'mhinz/vim-startify'
" }}}
" FastFold {{{
Plug 'konfekt/fastfold'
" }}}
" Toggle vim cursor in iTerm2{{{
Plug 'jszakmeister/vim-togglecursor'
" }}}
" fzf {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-buftabline'
" }}}

call plug#end()

" }}}

                                                     " ----------------------------------------------------------------------- "
                                                     "                               Vim Settings                              "
                                                     " ----------------------------------------------------------------------- "

" Vim Settings {{{

" -------------------------------- "
"          Color Scheme            "
" -------------------------------- "

set termguicolors
set background=dark
"let g:despacio_Sunset = 1
let g:despacio_Twilight = 1
colorscheme despacio
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  set t_ut=
endif

" -------------------------------- "
"            GUI Config            "
" -------------------------------- "

"set t_Co=256
set encoding=utf8
set signcolumn=yes

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
  let foldtextstart = strpart('✦' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
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
  let foldtextstart = strpart('✦ ' . line, 0, (winwidth(0)*2)/3)
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

" Ruby Specific
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

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
    autocmd bufwritepost ~/dotfiles/vimrc source ~/.vimrc
augroup END

" --------------------------------- "
"                Misc               "
" --------------------------------- "


" changing leader key
let mapleader = ","

" copy to clipboard
set clipboard=unnamed

" highlight folded text in gui and cterm
hi Folded guifg=#FFC66D
hi clear Conceal

" hide mode status as well as completion message
set noshowmode
set shortmess-=m
set shortmess+=cWIs

" open vimrc in a new tab
nmap <leader>cv :tabedit $MYVIMRC<CR>  

" Show Matching tags/parens/ ect
set showmatch 

" changing matching parenthesis colors
highlight MatchParen ctermfg=white guifg=red guibg=NONE
 
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" opening split windows/panes on the right side
set splitright

" change color and character of vertical split bar
set fillchars=vert:\│
hi VertSplit ctermfg=black ctermbg=NONE

" change SignColumn color
"hi SignColumn ctermbg=NONE 

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

" Use ranger as file explorer
fun! RangerChooser()
  exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
  if filereadable('/tmp/chosenfile')
    exec 'edit ' . system('cat /tmp/chosenfile')
    call system('rm /tmp/chosenfile')
  endif
  redraw!
endfun

map <Leader>x :call RangerChooser()<CR>

" map dd to blackhole register
nnoremap d "_d
vnoremap d "_d

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
" source : https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/ 
noremap Y y$

" Make Ctrl-e jump to the end of the current line in the insert mode. This is
" handy when you are in the middle of a line and would like to go to its end
" without switching to the normal mode.
" source : https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/ 
inoremap <C-e> <C-o>$

" change visual mode color
hi Visual ctermbg=white ctermfg=black

" change quickfix window line color
hi LineNr ctermbg=NONE ctermfg=yellow

"  clear cursorline highlight
"hi clear CursorLine

" turn off highlight until next search 
nnoremap <silent> <esc><esc>  :noh<cr><esc>

" hide unused buffers
set hidden

" display buffer list and invoke buffer command 
nnoremap <Leader>p :bprev<cr>
nnoremap <Leader>n :bnext<cr>

" Quit with Q instead of :q!.
noremap <silent> Q :q!<CR>

" move cursor by display lines in wrapped text
nnoremap j gj
nnoremap k gk

" Jump to the previous/next tab.
noremap <silent> J gT
noremap <silent> K gt

" re-indents edited source code on the fly
inoremap <F4> <Esc>m'ggVG=``zzgi

" reduce delay when switching modes
set timeoutlen=1000 ttimeoutlen=0

" make a simple 'search' and 'replace' text object.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" always on sign column
autocmd BufEnter * sign define dummy
autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')

" sudo inside vim
cmap w!! w !sudo tee > /dev/null %

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
set completeopt-=preview
let g:neocomplete#max_list = 10
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=3
let g:neocomplete#lock_buffer_name_pattern= '\*ku\*'

if !exists('g:neocomplete#sources#omni#input_patterns')
		  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#force_omni_input_patterns')
    let g:neocomplete#sources#omni#force_omni_input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php =
	\ '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby compiler ruby

" }}}
" MatchTagAlways {{{

" --------------------------------------------- "
"           Settings for MatchTagAlways         "
" --------------------------------------------- "
let g:mta_use_matchparen_group = 0
let g:mta_set_default_matchtag_color = 0
highlight MatchTag ctermfg=208 guifg=#FF4500

" }}}
" Lean Status Line {{{

" --------------------------------------- "
"             Lean Status Line            "
" --------------------------------------- "

" source : https://gabri.me/blog/diy-vim-statusline

let g:buftabline_indicators=1
set showtabline=2
set tabline="%1T"
set laststatus=2

highlight User1 cterm=None gui=None ctermfg=007 guifg=white
highlight User2 cterm=None gui=None ctermfg=008 guifg=white
highlight User3 cterm=None gui=None ctermfg=008 guifg=white
highlight User4 cterm=None gui=None ctermfg=008 guifg=white
highlight User5 cterm=None gui=None ctermfg=008 guifg=white
highlight User7 cterm=None gui=None ctermfg=008 guifg=white
highlight User8 cterm=None gui=None ctermfg=008 guifg=white
highlight User9 cterm=None gui=None ctermfg=007 guifg=white

let g:currentmode={
      \ 'n'  : 'N ',
      \ 'no' : 'N·Operator Pending ',
      \ 'v'  : 'V ',
      \ 'V'  : 'V·Line ',
      \ '' : 'V·Block ',
      \ 's'  : 'Select ',
      \ 'S'  : 'S·Line ',
      \ '' : 'S·Block ',
      \ 'i'  : 'I ',
      \ 'R'  : 'R ',
      \ 'Rv' : 'V·Replace ',
      \ 'c'  : 'Command ',
      \ 'cv' : 'Vim Ex ',
      \ 'ce' : 'Ex ',
      \ 'r'  : 'Prompt ',
      \ 'rm' : 'More ',
      \ 'r?' : 'Confirm ',
      \ '!'  : 'Shell ',
      \ 't'  : 'Terminal '
      \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008 guifg=black guibg=white gui=None cterm=None'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005 guifg=black gui=None cterm=None'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004 guifg=black gui=NONE cterm=None'
  else
    exe 'hi! StatusLine ctermfg=006 guifg=black gui=None cterm=None'
  endif
  return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return ' '.fugitive#head()
  else
    return ''
endfunction

" http://stackoverflow.com/a/10416234/213124
set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)   
set statusline+=%8*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
set statusline+=%#warningmsg#
set statusline+=%0*\ %{SyntasticStatuslineFlag()}\%=\   " Syntastic errors

" }}}
" NERDTree {{{

" ------------------------------------ "    
"           NERDTree setting           "
" ------------------------------------ "
nnoremap et :NERDTreeToggle <cr>
noremap <leader>f :NERDTreeFind<cr>

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
let g:syntastic_php_checkers=['php']
let g:syntastic_ruby_checkers=['rubocop']
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }
let g:syntastic_stl_format = '%E{✗ : %e}%B{, }%W{! : %w}'
highlight SyntasticErrorSign guifg=red guibg=NONE
highlight SyntasticWarningSign guifg=#87afff guibg=NONE

" }}}
" Javascript {{{

" ----------------------------------------------- "
"            Setting for Javascript               "
" ----------------------------------------------- "

set conceallevel=1
set concealcursor=nvic
let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" }}}
" Toggle Cursor{{{

let g:togglecursor_default = "block"
let g:togglecursor_insert  = "line"
let g:togglecursor_leave   = "block"
let g:togglecursor_replace = "underline"

" }}} 
" FZF related {{{

let g:fzf_layout = { 'down': '~40%' }
nnoremap <silent> <leader>l :FZF<cr>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>w :Windows<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "\!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
" }}}
