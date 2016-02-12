if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

filetype off
call plug#begin('~/.config/nvim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimproc'
Plug 'Valloric/YouCompleteMe', {'do': 'python install.py --clang-completer --system-libclang --gocode-completer'}
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'derekwyatt/vim-scala', {'for': 'scala'}
Plug 'edsono/vim-matchit'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
Plug 'junegunn/vim-easy-align'
Plug 'kassio/neoterm'
Plug 'lervag/vimtex'
Plug 'm2mdas/phpcomplete-extended', {'for': 'php'}
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim', {'for': ['php', 'html', 'blade']}
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags'

call plug#end()

filetype plugin indent on

" Settings
syntax on

set autoindent
set expandtab
set smarttab
set sts=4
set sw=4
set ts=4

set backspace=indent,eol,start
set breakindent
set complete-=1
set completeopt-=preview
set cursorline
set foldmethod=marker
set ignorecase
set incsearch
set laststatus=2
set linebreak
set mouse=a
set nofoldenable
set nohidden
set number
set ruler
set scrolloff=8
set showcmd
set smartcase
set splitbelow
set splitright
set timeoutlen=3000
set ttimeoutlen=100
set wildmenu

" Appearance
colorscheme gruvbox
set background=dark
set fillchars=vert:\ 
let &showbreak = '↳ '

if has('gui_running')
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=l
    set guioptions-=b
    set guioptions-=m
    set guifont=InputMonoCondensed:h14
endif

" Autocommands
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType go setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType george nnoremap <Leader>gc :GeorgeCheck<CR>
autocmd FileType markdown setlocal spell
autocmd BufWritePost * Neomake
autocmd BufRead * Neomake
autocmd BufReadPost quickfix nnoremap <space> :ccl<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
autocmd BufRead,BufNewFile *.cal call SetupCal()
function! SetupCal()
    nnoremap <Leader>eq 0yf=Iprint "<C-R>"", <Esc>
    :Tnew
    :Tmap clear; calcprint <C-R>=expand("%")<CR>
    autocmd BufWritePost <buffer> execute("normal ,tt")
endfunction

" Mappings
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <Up> g<Up>
nnoremap <Down> g<Down>
nnoremap <silent> <space> :nohlsearch<CR>zz
nnoremap Q <Nop>
nnoremap N Nzz
nnoremap n nzz
nnoremap <Leader>p :set invpaste<CR>
nnoremap <Leader>box I<bar> <esc>A <bar><esc>yyPr+lv$hr-$r+yyjp

" Other mappings
nnoremap <Leader>ccp :!clear && compile cpp % "-Wall -std=c++14" "-o $(basename % .cc)" && ./"$(basename % .cc)"<CR>
nnoremap <Leader>ccc :!clear && compile c % "-Wall -std=c99" "-o $(basename % .c)" && ./"$(basename % .c)"<CR>

" Plugin mappings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>t<bar> vip:Tabularize /<bar><CR>
nnoremap <Leader>gor :GoRun<CR>
nnoremap <Leader>god :GoDef<CR>
nnoremap <Leader>got :GoTest<CR>
nnoremap <Leader>g? :GoDoc<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <Leader>s :TREPLSend<CR>
nnoremap <Leader>v :Validate<CR>
nnoremap <Leader>tt :TREPLSend<CR>
vnoremap <Leader>tt :TREPLSend<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Other settings
let g:airline#extensions#wordcount#enabled = 0
let g:airline_left_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_right_sep = ''
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0
let g:neomake_verbose = 0
let g:neoterm_automap_keys = '<Leader>tt'
let g:neoterm_position = 'vertical'
let g:vimtex_fold_enabled = 0
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'

" Neomake settings
let g:neomake_error_sign = {
    \ 'text': 'E>',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_warning_sign = {
    \ 'text': 'W>',
    \ 'texthl': 'WarningMsg',
    \ }

" Fixes for C-h
if has ('nvim')
    nmap <BS> <C-w>h
endif
