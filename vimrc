syntax on
set number
set wildmode=longest,list,full
set cursorline
colorscheme slate
set wildmenu
set hlsearch
set directory=~/.vim/swap,.
set nocompatible              " be iMproved
autocmd BufWritePre * :%s/\s\+$//e
set wrap
set linebreak
" note trailing space at end of next line
set showbreak=>\ \ \
filetype off                  " required!
let g:Powerline_symbols = 'fancy'
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set laststatus=2
set t_Co=256
set ff=unix
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"
let g:airline_powerline_fonts = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'fatih/vim-go'
"autocmd vimenter * if !argc() NERDTree | endif
" My bundles here:
"
" original repos on GitHub
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'terryma/vim-multiple-cursors'
Bundle 'bling/vim-airline'
Bundle 'wesleyche/Trinity'
Bundle 'rking/ag.vim'
" vim-scripts repos
Bundle 'L9'
Bundle 'taglist.vim'
Bundle 'FuzzyFinder'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/PreciseJump'
Bundle 'jeetsukumaran/vim-buffergator'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'panozzaj/vim-autocorrect'
Bundle 'itchyny/calendar.vim'
Bundle 'tpope/vim-fireplace'
Bundle 'slashmili/alchemist.vim'
Bundle 'elixir-lang/vim-elixir'
Bundle "tommcdo/vim-exchange"
Bundle 'NLKNguyen/papercolor-theme'
Bundle 'janko-m/vim-test'

" Collaborative editing with DOM
Bundle 'FredKSchott/CoVim'

:let g:haddock_browser="/usr/bin/firefox"
filetype indent plugin on     " required!
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

"set laststatus=2

:set tabstop=4 shiftwidth=4 expandtab
cmap w!! w !sudo tee %
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
" SML make code {{{
autocmd FileType sml setlocal makeprg=rlwrap\ sml\ -P\ full\ '%'
"  }}}
let g:zipPlugin_ext = '*.zip,*.jar,*.xpi,*.ja,*.war,*.ear,*.celzip,*.oxt,*.kmz,*.wsz,*.xap,*.docx,*.docm,*.dotx,*.dotm,*.potx,*.potm,*.ppsx,*.ppsm,*.pptx,*.pptm,*.ppam,*.sldx,*.thmx,*.crtx,*.vdw,*.glox,*.gcsx,*.gqsx'
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags=./tags;/
nmap <F12> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
  \:!cscope -b -i cscope.files -f cscope.out<CR>
  \:cs reset<CR>
:nmap <C-e> :e#<CR>
:nmap <C-q> :bnext<CR>
:imap  ;; <Esc>
:nmap <C-t> :tabnew<CR>
:nnoremap <S-h> gT
:nnoremap <S-l> gt
let g:alchemist_tag_disable = 1


let g:alchemist_tag_map = '<C-]>'
let g:alchemist_tag_stack_map = '<C-m>'




" Numbering



function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>



:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber





:nmap :cal :Calendar -view=year -split=horizontal -position=below -height=12
autocmd Filetype gitcommit setlocal spell textwidth=72
:set textwidth=72


nmap <silent> <leader>q :TestNearest<CR>
nmap <silent> <leader>Q :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
