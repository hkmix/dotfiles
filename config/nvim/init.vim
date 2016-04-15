" Auto-install vim-plug if needed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

filetype off
call plug#begin('~/.config/nvim/plugged')

Plug 'Lokaltog/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'Valloric/YouCompleteMe', {'do': 'python install.py --clang-completer --system-libclang --gocode-completer --omnisharp-completer'}
Plug 'airblade/vim-rooter'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'derekwyatt/vim-scala', {'for': 'scala'}
Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
Plug 'eagletmt/neco-ghc', {'for': 'haskell'}
Plug 'edsono/vim-matchit'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'godlygeek/tabular'
Plug 'Glench/Vim-Jinja2-Syntax', {'for': ['html', 'jinja']}
Plug 'google/vim-searchindex'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
Plug 'junegunn/vim-easy-align'
Plug 'kassio/neoterm'
Plug 'kentaroi/cocoa.vim', {'for': ['objc', 'objcpp']}
Plug 'lervag/vimtex', {'for': ['plaintex', 'latex', 'tex']}
Plug 'm2mdas/phpcomplete-extended', {'for': 'php'}
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim', {'for': ['php', 'html', 'blade']}
Plug 'morhetz/gruvbox'
Plug 'ntpeters/vim-better-whitespace'
Plug 'petRUShka/vim-opencl', {'for': ['opencl', 'cl']}
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'xolox/vim-misc' | Plug 'xolox/vim-shell' | Plug 'xolox/vim-easytags'

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
set foldmethod=manual
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
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_invert_signs = 1
let g:solarized_underline = 0
set background=dark
colorscheme solarized
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
augroup general
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd BufWritePost * Neomake
    autocmd BufRead * Neomake
    autocmd CompleteDone * silent! pclose
augroup END

augroup terminal
    autocmd!
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
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
nnoremap <silent> <space> :nohlsearch<CR>
nnoremap <silent> <Leader><space> :nohlsearch<CR>zz
nnoremap Q <Nop>
nnoremap N Nzz
nnoremap n nzz
nnoremap <Leader>p :set invpaste<CR>
nnoremap <Leader>box I<bar> <esc>A <bar><esc>yyPr+lv$hr-$r+yyjp

" Terminal bindings
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l

" Language-specific groups
augroup filetype_c
    autocmd!
    autocmd FileType c nnoremap <Leader>cc :!clear && compile c % "-Wall -std=c99" "-o $(basename % .c)" && ./"$(basename % .c)"<CR>
    autocmd FileType c nnoremap <buffer> <Leader>vh :vsp %<.h<CR>
    autocmd FileType c nnoremap <buffer> <Leader>xh :sp %<.h<CR>
    autocmd FileType c nnoremap <buffer> <Leader>vc :vsp %<.c<CR>
    autocmd FileType c nnoremap <buffer> <Leader>xc :sp %<.c<CR>
augroup END

augroup filetype_cal
    autocmd!
    autocmd BufRead,BufNewFile *.cal call SetupCal()
augroup END
function! SetupCal()
    nnoremap <buffer> <Leader>eq 0yf=Iprint "<C-R>"", <Esc>
    :Tnew
    :Tmap clear; calcprint <C-R>=expand("%")<CR>
    autocmd BufWritePost <buffer> execute("normal ,tt")
endfunction

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <Leader>cc :!clear && compile cpp % "-Wall -std=c++14" "-o $(basename % .cc)" && ./"$(basename % .cc)"<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vh :vsp %<.h<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xh :sp %<.h<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vc :vsp %<.cpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xc :sp %<.cpp<CR>
augroup END

augroup filetype_objcpp
    autocmd!
    autocmd FileType objcpp nnoremap <buffer> <Leader>vh :vsp %<.h<CR>
    autocmd FileType objcpp nnoremap <buffer> <Leader>xh :sp %<.h<CR>
    autocmd FileType objcpp nnoremap <buffer> <Leader>vc :vsp %<.cpp<CR>
    autocmd FileType objcpp nnoremap <buffer> <Leader>xc :sp %<.cpp<CR>
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
augroup END

augroup filetype_metal
    autocmd!
    autocmd BufRead,BufNewFile *.metal setlocal ft=objcpp syntax=cpp
augroup END

" difftool mappings
nnoremap <Leader>lo :diffget LOCAL<CR>
nnoremap <Leader>re :diffget REMOTE<CR>

" Plugin mappings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>t<bar> vip:Tabularize /<bar><CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <Leader>S ggVG:TREPLSend<CR>
nnoremap <Leader>s :TREPLSend<CR>
xnoremap <Leader>s :TREPLSend<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nnoremap <Leader>ggr :GitGutterRevertHunk<CR>
nnoremap <Leader>ggs :GitGutterStageHunk<CR>

" Other settings
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
let g:markdown_fenced_languages = ['cpp', 'objc', 'objcpp']
let g:neomake_cpp_enabled_makers = []
let g:neomake_html_enabled_makers = []
let g:neomake_verbose = 0
let g:neoterm_automap_keys = '<Leader>tt'
let g:neoterm_position = 'vertical'
let g:rooter_manual_only = 1
let g:rooter_disable_map = 1
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_show_visibility = 1
let g:vimtex_fold_enabled = 0
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_semantic_triggers = {'haskell': ['.'], 'objcpp': ['.', '->', '::']}
let g:ycm_confirm_extra_conf = 0

" Neomake settings
let g:neomake_error_sign = {
            \ 'text': 'E>',
            \ 'texthl': 'ErrorMsg',
            \ }
let g:neomake_warning_sign = {
            \ 'text': 'W>',
            \ 'texthl': 'WarningMsg',
            \ }

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

" Neovim fix
if has('nvim')
    nmap <BS> <C-w>h
endif
