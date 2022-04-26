"  _   _                 _                           _              ___
" | \ | | ___  _____   _(_)_ __ ___      _    __   _(_)_ __ ___    ( _ )
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \   _| |_  \ \ / / | '_ ` _ \   / _ \
" | |\  |  __/ (_) \ V /| | | | | | | |_   _|  \ V /| | | | | | | | (_) |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|   |_|     \_/ |_|_| |_| |_|  \___/

if has('nvim')
    let s:path = '~/.config/nvim'
else
    let s:path = '~/.vim'
    set nocompatible
end

" +---------+
" | Plugins |
" +---------+
filetype off

if empty(glob(s:path . '/autoload/plug.vim'))
    execute 'silent !curl -fLo ' . s:path . '/autoload/plug.vim --create-dirs'
                \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(s:path . '/plugged')
let g:plug_url_format = 'git@github.com:%s.git'

Plug 'Chiel92/vim-autoformat'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-rooter'
Plug 'calviken/vim-gdscript3', {'for': ['gdscript']}
Plug 'cespare/vim-toml', {'for': ['toml']}
Plug 'dhruvasagar/vim-table-mode'
Plug 'editorconfig/editorconfig-vim'
Plug 'google/vim-searchindex'
Plug 'hkmix/jzwiki.vim'
Plug 'hkmix/vim-closer'
Plug 'hkmix/vim-colors-solarized-simple'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install --no-update-rc'}
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex', {'for': ['tex']}
Plug 'mattn/emmet-vim', {'for': ['html', 'javascript', 'php']}
Plug 'mhinz/vim-signify'
Plug 'neovimhaskell/haskell-vim', {'for': ['haskell']}
Plug 'ntpeters/vim-better-whitespace'
Plug 'rust-lang/rust.vim', {'for': ['rust']}
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'

" Platform-specific plugins.
let s:platform_rc = '~/.platform.vim'
if !empty(glob(s:platform_rc))
    execute 'source ' . s:platform_rc
endif

call plug#end()

" +------------------+
" | General settings |
" +------------------+
filetype plugin indent on
syntax on

set autoindent
set cino+=:0,l1,g0,N-s,m1,j1
set expandtab
set exrc
set smarttab
set guicursor=
set sts=4
set sw=4
set ts=4

set backspace=indent,eol,start
if has('linebreak')
    set breakindent
    set linebreak
endif
set complete-=1
set completeopt=noinsert,menuone,noselect
set cursorline
set encoding=utf-8
set foldmethod=manual
set ignorecase
if has('nvim')
    set inccommand=nosplit
end
set incsearch
set laststatus=2
set mouse=a
set nofoldenable
set nohidden
set nohlsearch
set nojoinspaces
set noshowmode
set nospell
set nottimeout
set ruler
set scrolljump=-50
set scrolloff=0
set showcmd
set shortmess+=mnrc
set smartcase
set splitbelow
set splitright
set timeoutlen=3000
set wildmenu

if has('nvim')
    set wildoptions=pum
endif

" Fix true colour issues with tmux.
if !has('nvim') || &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" +------------+
" | Appearance |
" +------------+
set background=dark
set colorcolumn=80,100
set fillchars=vert:\  " Intentional trailing escaped space.
let &showbreak = '↳ '

" Solarized theme and tweaks.
let g:solarized_termtrans=1
colorscheme solarized
hi VertSplit guibg=#073642

" Show non-ASCII characters.
highlight nonascii guibg=Red ctermbg=1 term=standout
autocmd BufReadPost * syntax match nonascii "[^\u0000-\u007F]"

" +-----------+
" | LightLine |
" +-----------+
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
let g:lightline.tabline = {
            \ 'colorscheme': 'solarized',
            \ 'left': [ [ 'tabs' ] ],
            \ 'right': [ [] ],
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
                \ ('' != expand('%:t') ? expand('%:t') : '[No name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" +-----------------+
" | Plugin settings |
" +-----------------+
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:haskell_classic_highlighting = 1
let g:markdown_fenced_languages = ['cpp', 'objc', 'objcpp', 'rust']
let g:rooter_manual_only = 1
let g:rustfmt_autosave = 1
let g:signify_sign_show_count = 0
let g:signify_sign_add = '+'
let g:signify_sign_change = '~'
let g:signify_sign_changedelete = g:signify_sign_change
let g:signify_sign_delete = '-'
let g:signify_sign_delete_first_line = '^'
let g:signify_vcs_list = ['git']
let g:table_mode_corner_corner = '+'
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_fold_enabled = 0
let g:vimtex_imaps_enabled = 0

" +--------------+
" | Key mappings |
" +--------------+
let mapleader = ' '
nnoremap <Leader>box I<bar> <esc>A <bar><esc>yyPr+lv$hr-$r+yyjp
nnoremap <Leader>h :set invhlsearch<CR>
nnoremap <Leader>l :set invnumber<CR>
nnoremap <Leader>p :set invpaste<CR>
nnoremap <Leader>? :echo expand('%:p')<CR>
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <Up> g<Up>
nnoremap <Down> g<Down>
nnoremap <silent> <Leader><space> zz
nnoremap n nzz
nnoremap N Nzz
nnoremap QQ Q
nnoremap Q <Nop>

" Terminal mappings.
if has('nvim')
    tnoremap <silent> <leader><esc> <C-\><C-n>
end

" difftool mappings.
nnoremap <Leader>lo :diffget LOCAL<CR>
nnoremap <Leader>re :diffget REMOTE<CR>

" Plugin mappings.
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gs :G<CR>
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

function! ToggleAutoformat()
    if !exists('#AutoformatGroup#BufWrite')
        augroup AutoformatGroup
            autocmd!
            autocmd BufWritePre <buffer> :Autoformat
        augroup END
        echo 'Autoformat enabled.'
    else
        augroup AutoformatGroup
            autocmd!
        augroup END
        echo 'Autoformat disabled.'
    endif
endfunction
nmap <silent> <leader>gf :Autoformat<CR>
nmap <silent> <leader>gF :call ToggleAutoformat()<CR>

nnoremap <silent> gC gc
nnoremap <silent> gc gC
xnoremap <silent> gC gc
xnoremap <silent> gc gC

" +--------------+
" | Autocommands |
" +--------------+
augroup general
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd FileType * let b:closer = 1
    autocmd FileType * call closer#enable()
    autocmd CompleteDone * silent! pclose
augroup END

augroup filetype_c
    autocmd!
    autocmd FileType c nnoremap <buffer> <Leader>vh :vsp %<.h<CR>
    autocmd FileType c nnoremap <buffer> <Leader>xh :sp %<.h<CR>
    autocmd FileType c nnoremap <buffer> <Leader>eh :e %<.h<CR>
    autocmd FileType c nnoremap <buffer> <Leader>vc :vsp %<.c<CR>
    autocmd FileType c nnoremap <buffer> <Leader>xc :sp %<.c<CR>
    autocmd FileType c nnoremap <buffer> <Leader>ec :e %<.c<CR>
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <Leader>vh :vsp %<.hh<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xh :sp %<.hh<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>eh :e %<.hh<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vc :vsp %<.cc<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xc :sp %<.cc<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>ec :e %<.cc<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vH :vsp %<.hpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xH :sp %<.hpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>eH :e %<.hpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vC :vsp %<.cpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xC :sp %<.cpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>eC :e %<.cpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>mh yy2pkI#ifndef <Esc>jI#define <Esc>jI#endif // <Esc>2O<Esc>O<Esc>
augroup END

augroup filetype_go
    autocmd!
    autocmd FileType go setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType go nnoremap <buffer> <Leader>gor :GoRun<CR>
    autocmd FileType go nnoremap <buffer> <Leader>god :GoDef<CR>
    autocmd FileType go nnoremap <buffer> <Leader>got :GoTest<CR>
    autocmd FileType go nnoremap <buffer> <Leader>g? :GoDoc<CR>
    autocmd BufWritePost *.go <buffer> :GoFmt
augroup END

augroup filetype_js
    autocmd!
    autocmd FileType javascript setlocal sts=2 sw=2 ts=2
augroup END

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal sts=4 sw=4 ts=4
augroup END

augroup filetype_tex
    autocmd!
    autocmd BufEnter *.tex setlocal filetype=tex
    autocmd FileType tex setlocal foldmethod=marker
    autocmd FileType tex setlocal colorcolumn=80 spell
    autocmd FileType tex nnoremap <buffer> <F8> :VimtexTocToggle<CR>
    autocmd FileType tex nnoremap <buffer> <Leader>tw gqip
    autocmd FileType tex imap <buffer> ]] <Plug>(vimtex-delim-close)
    autocmd FileType tex nnoremap <buffer> )) <Plug>(vimtex-delim-toggle-modifier)
    autocmd FileType tex nnoremap <buffer> cE <Plug>(vimtex-env-change)
    autocmd FileType tex nnoremap <buffer> ]] <Plug>(vimtex-]])
    autocmd FileType tex nnoremap <buffer> ][ <Plug>(vimtex-][)
    autocmd FileType tex nnoremap <buffer> [] <Plug>(vimtex-[])
    autocmd FileType tex nnoremap <buffer> [[ <Plug>(vimtex-[[)
augroup END

augroup filetype_yaml
    autocmd!
    autocmd BufEnter *.clang-format setlocal filetype=yaml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2
augroup END

if has('nvim')
    augroup terminal
        autocmd!
        autocmd TermOpen * setlocal nonumber norelativenumber
        autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
    augroup END
end

" +--------------+
" | Misc helpers |
" +--------------+
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap <silent> <Leader>cc :call SynStack()<CR>
nnoremap <silent> <Leader>cs :colo solarized<CR>
nnoremap <silent> <Leader>cT :so $VIMRUNTIME/syntax/hitest.vim<CR>
" vim: sw=4
