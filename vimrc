syntax on
" set number
set wildmode=longest,list,full
set cursorline
set wildmenu
set hlsearch
set nocompatible              " be iMproved
filetype off                  " required!
let g:Powerline_symbols = 'fancy'
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set laststatus=2
set t_Co=256
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"
let g:airline_powerline_fonts = 1
colorscheme desert
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
"autocmd vimenter * if !argc() NERDTree | endif
" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'bling/vim-airline'
Bundle 'wesleyche/Trinity'
Bundle 'rking/ag.vim'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/PreciseJump'
Bundle 'wincent/command-t'
Bundle 'derekwyatt/vim-scala'
Bundle 'jeetsukumaran/vim-buffergator'
filetype indent plugin on     " required!

:set tabstop=2 shiftwidth=2 expandtab
cmap w!! w !sudo tee >/dev/null 
" Strip the newline from the end of a string
function! Chomp(str)
  return substitute(a:str, '\n$', '', '')
endfunction

" Find a file and pass it to cmd
function! DmenuOpen(cmd)
  let fname = Chomp(system("git ls-files | dmenu -i -l 20 -p " . a:cmd))
  if empty(fname)
    return
  endif
  execute a:cmd . " " . fname
endfunction
map <c-t> :call DmenuOpen("tabe")<cr>
map <c-f> :call DmenuOpen("e")<cr>
nmap ,f :FufFileWithCurrentBufferDir<CR>
nmap ,b :FufBuffer<CR>
nmap ,t :FufTaggedFile<CR>
set backspace=indent,eol,start
autocmd FileType sml map <silent> <buffer> <leader><space> <leader>cd:w<cr>:!sml %<cr>
autocmd FileType * match ErrorMsg '\%>100v.\+'
autocmd FileType sml match ErrorMsg '\%>80v.\+'
autocmd FileType mkd match none
autocmd FileType unite match none
" SML make code {{{
autocmd FileType sml setlocal makeprg=rlwrap\ sml\ -P\ full\ '%'
"  }}}
