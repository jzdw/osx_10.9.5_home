

colorscheme ir_black

let mapleader = "\\"
call pathogen#infect()
call pathogen#helptags()

if has("gui_running")
  colorscheme solarized
  set background=dark
  if has("gui_gtk2")
    colorscheme solarized
    set background=dark
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    colorscheme solarized
    set background=dark
    "set guifont=Menlo\ Regular:h16
    set guifont=Monaco:h14
  elseif has("gui_win32")
    colorscheme solarized
    set background=dark
    "set guifont=Lucida_Sans_Typewriter:h14:cANSI
    set guifont=Monaco:h14
    "set guifont=Lucida_Sans_Typewriter:h14
    "colorscheme wombat
    colorscheme jellybeans
    "syntax off
  endif
endif


syntax on

" python mode ----- {{{
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
"let g:pymode_rope = 0
" }}}

" options ----- {{{
set backspace=indent,eol,start
set matchpairs+=<:>
set more
" wrapping
" set nowrap
set linebreak
set showbreak=..
command! -nargs=* Wrap set wrap linebreak nolist
" search highlighting options
set hlsearch    "highlight the next match
set incsearch   " highlight when typing

" }}}
" vim key maps --------- {{{
vnoremap <c-j> gj
vnoremap <c-k> gk
vnoremap <c-4> g$
vnoremap <c-6> g^
vnoremap <c-0> g0
nnoremap <c-j> gj
nnoremap <c-k> gk
nnoremap <c-4> g$
nnoremap <c-6> g^
nnoremap <c-0> g0

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


vnoremap <leader>t= :Tabularize /=<CR>
" vnoremap <leader>t| :Tabularize / |<CR>
" nnoremap <leader>t| :Tabularize / |<CR>

nnoremap <leader>l :set list!<CR>
" change list characters, use     
" set listchars=tab:▸\ , eol:¬
set listchars=eol:¬
" }}}
" status line  --- {{{
set showcmd
set ruler
" }}}
" indenting  ------ {{{
"set ai     "Automatically set the indent of a new line (local or buffer)
"set si     "smartindent (local or buffer)
"set pastetoggle<F2> "whether autoindent when pasting codes
filetype plugin indent on      " indent based on filetype
" setting on/off invisible characters
" set list, set nolist, set list! to toggle
" use \l to toggle the list/nolist
" }}}
" tab configurations  {{{
" tabstop	the width of tab character
" expandtab	when enabled, it would use space to replace tab
" softtabstop	fine tune the space characters to be inserted
" shiftwidth	determines the number of spaces to be inserted when using indentation commands in insert mode
" set it such that no tab would be used. all spaces and tab moves would be 4 spaces wide
set tabstop     =4
set expandtab
set softtabstop =4
set shiftwidth  =4

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction
nmap <C-S-Tab> :call SummarizeTabs()<CR>
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts 
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    end
  finally
    echohl None
  endtry
endfunction
" }}}

function! GetMeow()
    echom "meow!"
    return "Meow string"
endfunction

