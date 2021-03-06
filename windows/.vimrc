set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
let g:plug_url_format = 'git@github.com:%s.git'

Plug 'Lokaltog/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimproc'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala', {'for': 'scala'}
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
Plug 'eagletmt/neco-ghc', {'for': 'haskell'}
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'google/vim-searchindex'
Plug 'hkmix/vim-george'
Plug 'itchyny/lightline.vim'
Plug 'lervag/vimtex'
Plug 'm2mdas/phpcomplete-extended', {'for': 'php'}
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim', {'for': ['php', 'html', 'blade']}
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tmhedberg/matchit'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-shell' | Plug 'xolox/vim-easytags'

call plug#end()

filetype plugin indent on

" Settings
syntax on

set autoindent
set cino+=(0,:0,l1,g0,N-s,m1,j1
set expandtab
set smarttab
set sts=2
set sw=2
set ts=2

set backspace=indent,eol,start
if has('linebreak')
    set breakindent
    set linebreak
endif
set complete-=1
set completeopt-=preview
set cursorline
set foldmethod=manual
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set nofoldenable
set nohidden
set nohlsearch
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
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_signs = 1
let g:solarized_underline = 0
set background=dark
colorscheme solarized
set colorcolumn=80,120
set fillchars=vert:\ 
let &showbreak = '↳ '

if has('gui_running')
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=l
    set guioptions-=b
    set guioptions-=m
    set guifont=PragmataPro\ 14
endif

" Autocommands
augroup general
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd CompleteDone * silent! pclose
augroup END

" General mappings
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <Up> g<Up>
nnoremap <Down> g<Down>
nnoremap <silent> <space> zz
nnoremap <silent> <Leader><space> :nohlsearch<CR>zz
nnoremap Q <Nop>
nnoremap N Nzz
nnoremap n nzz
nnoremap <Leader>p :set invpaste<CR>
nnoremap <Leader>box I<bar> <esc>A <bar><esc>yyPr+lv$hr-$r+yyjp

" difftool mappings
nnoremap <Leader>lo :diffget LOCAL<CR>
nnoremap <Leader>re :diffget REMOTE<CR>

" Plugin mappings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>t<bar> vip:Tabularize /<bar><CR>
nmap <F8> :TagbarToggle<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <Leader>ggr :GitGutterRevertHunk<CR>
nnoremap <Leader>ggs :GitGutterStageHunk<CR>

" Other settings
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"
let g:easytags_auto_highlight = 0
let g:easytags_suppress_report = 1
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
let g:jedi#force_py_version = 3
let g:markdown_fenced_languages = ['cpp', 'objc', 'objcpp']
let g:rooter_manual_only = 1
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_show_visibility = 1
let g:vimtex_fold_enabled = 0
let g:vimtex_latexmk_callback = 0
let g:vimtex_imaps_enabled = 0
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/ycm_extra_conf.py'
let g:ycm_semantic_triggers = {'haskell': ['.'], 'objcpp': ['.', '->', '::']}
let g:ycm_confirm_extra_conf = 0

" LightLine settings
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ }

function! LightLineModified()
    if &modified
        return "+"
    else
        return ""
    endif
endfunction

function! LightLineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "RO"
    else
        return ""
    endif
endfunction

function! LightLineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" Show non-ASCII characters
highlight nonascii guibg=Red ctermbg=1 term=standout
autocmd BufReadPost * syntax match nonascii "[^\u0000-\u007F]"

" Language-specific groups
augroup filetype_c
    autocmd!
    autocmd FileType c nnoremap <Leader>cc :!clear && compile c % "-Wall -std=c99" "-o $(basename % .c)" && ./"$(basename % .c)"<CR>
    autocmd FileType c nnoremap <buffer> <Leader>vh :vsp %<.h<CR>
    autocmd FileType c nnoremap <buffer> <Leader>xh :sp %<.h<CR>
    autocmd FileType c nnoremap <buffer> <Leader>vc :vsp %<.c<CR>
    autocmd FileType c nnoremap <buffer> <Leader>xc :sp %<.c<CR>
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <Leader>cc :!clear && compile cpp % "-Wall -std=c++14" "-o $(basename % .cc)" && ./"$(basename % .cc)"<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vh :vsp %<.h<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xh :sp %<.h<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vc :vsp %<.cc<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xc :sp %<.cc<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vC :vsp %<.cpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xC :sp %<.cpp<CR>
augroup END

augroup filetype_objcpp
    autocmd!
    autocmd FileType objcpp nnoremap <buffer> <Leader>vh :vsp %<.h<CR>
    autocmd FileType objcpp nnoremap <buffer> <Leader>xh :sp %<.h<CR>
    autocmd FileType objcpp nnoremap <buffer> <Leader>vC :vsp %<.cpp<CR>
    autocmd FileType objcpp nnoremap <buffer> <Leader>xC :sp %<.cpp<CR>
    autocmd FileType george nnoremap <buffer> <Leader>gc :GeorgeCheck<CR>
    autocmd BufReadPost quickfix nnoremap <buffer> <space> :ccl<CR>
augroup END

augroup filetype_go
    autocmd!
    autocmd FileType go setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType go nnoremap <buffer> <Leader>gor :GoRun<CR>
    autocmd FileType go nnoremap <buffer> <Leader>god :GoDef<CR>
    autocmd FileType go nnoremap <buffer> <Leader>got :GoTest<CR>
    autocmd FileType go nnoremap <buffer> <Leader>g? :GoDoc<CR>
    autocmd BufWritePost *.go <buffer> :GoFmt<CR>
augroup END

augroup filetype_haskell
    autocmd!
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
augroup END

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal sts=2 sw=2 ts=2
augroup END

augroup filetype_metal
    autocmd!
    autocmd BufRead,BufNewFile *.metal setlocal ft=objcpp syntax=cpp
augroup END

augroup filetype_tex
    autocmd!
    autocmd FileType tex setlocal colorcolumn=80 spell
    autocmd FileType tex nnoremap <buffer> <Leader>tw gqip
    autocmd FileType tex nnoremap <buffer> <Leader>s bf)a}<Esc>F(i{<Esc>%a
    autocmd FileType tex nnoremap <buffer> <Leader>[ o\[  \]<Esc>2hi
    autocmd FileType tex let delimitMate_matchpairs="(:),[:],{:},`:'"
    autocmd Filetype tex let delimitMate_quotes="\" '"
augroup END
