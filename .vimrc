
execute pathogen#infect()

colorscheme ir_black
syntax on
set more

"wrapping
"set nowrap
set linebreak
set showbreak=..
command! -nargs=* Wrap set wrap linebreak nolist
vmap <c-j> gj
vmap <c-k> gk
vmap <c-4> g$
vmap <c-6> g^
vmap <c-0> g0
nmap <c-j> gj
nmap <c-k> gk
nmap <c-4> g$
nmap <c-6> g^
nmap <c-0> g0

"status line
set showcmd
set ruler

"misc settings
set backspace=indent,eol,start
set matchpairs+=<:>

"Indenting
"set ai     "Automatically set the indent of a new line (local or buffer)
"set si     "smartindent (local or buffer)
"set pastetoggle<F2>		"whether autoindent when pasting codes

" setting on/off invisible characters
" set list, set nolist, set list! to toggle
" use \l to toggle the list/nolist

nmap <leader>l :set list!<CR>
"change list characters, use     
" set listchars=tab:▸\ , eol:¬
set listchars=eol:¬

" tab configurations
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

if exists(":Tabularize")
    nmap <leader>z= :Tabularize /=<CR>
    vmap <leader>z= :Tabularize /=<CR>
    nmap <leader>z: :Tabularize /:\zs<CR>
    vmap <leader>z: :Tabularize /:\zs<CR>
    vmap <leader>z| :Tabularize /|<CR>
    nmap <leader>z| :Tabularzie /|<CR>
endif

