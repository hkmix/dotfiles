"  _   _                 _                           _              ___
" | \ | | ___  _____   _(_)_ __ ___      _    __   _(_)_ __ ___    ( _ )
" |  \| |/ _ \/ _ \ \ / / | '_ ` _ \   _| |_  \ \ / / | '_ ` _ \   / _ \
" | |\  |  __/ (_) \ V /| | | | | | | |_   _|  \ V /| | | | | | | | (_) |
" |_| \_|\___|\___/ \_/ |_|_| |_| |_|   |_|     \_/ |_|_| |_| |_|  \___/

let s:nvim = has('nvim')

if s:nvim
    let s:path = '~/.config/nvim'
else
    let s:path = '~/.vim'
    set nocompatible
end

filetype off

if empty(glob(s:path . '/autoload/plug.vim'))
    execute 'silent !curl -fLo ' . s:path . '/autoload/plug.vim --create-dirs'
                \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(s:path . '/plugged')
let g:plug_url_format = 'git@github.com:%s.git'

Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'dhruvasagar/vim-table-mode'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'google/vim-searchindex'
Plug 'hkmix/vim-george'
Plug 'icymind/NeoSolarized'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
Plug 'junegunn/vim-easy-align'
Plug 'lervag/vimtex'
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim', {'for': ['html']}
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-abbrfuzzy'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'
Plug 'ntpeters/vim-better-whitespace'
Plug 'roxma/nvim-yarp'
Plug 'rust-lang/rust.vim'
Plug 'tmhedberg/matchit'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'

" Neovim-specific plugins.
if s:nvim
    Plug 'kassio/neoterm'
end

call plug#end()

filetype plugin indent on

" Settings.
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
set foldmarker={{{{{,}}}}}
set foldmethod=manual
set ignorecase
if s:nvim
    set inccommand=nosplit
end
set incsearch
set laststatus=2
set mouse=a
set nofoldenable
set nohidden
set nohlsearch
set noshowmode
set nospell
set nottimeout
set number
set ruler
set scrolljump=-50
set scrolloff=4
set showcmd
set shortmess+=mnrc
set smartcase
set splitbelow
set splitright
set timeoutlen=3000
set wildmenu

" Fix true colour issues with tmux.
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" Appearance.
set termguicolors
set background=dark
set colorcolumn=80,100
set fillchars=vert:\ 
let &showbreak = '↳ '
if empty($TERM)
    " Some kind of GUI, assume it supports true colours.
    let g:neosolarized_vertSplitBgTrans = 0
    let g:neosolarized_bold = 1
    let g:neosolarized_underline = 1
    let g:neosolarized_italic = 1
    colorscheme NeoSolarized
else
    let g:solarized_extra_hi_groups = 1
    let g:solarized_termtrans = 1
    colorscheme solarized8
endif

" Autocommands
augroup general
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    autocmd CompleteDone * silent! pclose
augroup END

" General mappings
let mapleader = ' '
nnoremap <Leader>box I<bar> <esc>A <bar><esc>yyPr+lv$hr-$r+yyjp
nnoremap <Leader>h :set hlsearch<CR>
nnoremap <Leader>p :set invpaste<CR>
nnoremap <Leader>? :echo expand('%:p')<CR>
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <Up> g<Up>
nnoremap <Down> g<Down>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <Leader><space> zz
nnoremap n nzz
nnoremap N Nzz
nnoremap Q <Nop>

" Terminal mappings.
if s:nvim
    tnoremap <silent> <leader><esc> <C-\><C-n>
end

" difftool mappings.
nnoremap <Leader>lo :diffget LOCAL<CR>
nnoremap <Leader>re :diffget REMOTE<CR>

" Plugin mappings.
nnoremap <C-p> :FZF<CR>
nnoremap <F8> :TagbarToggle<CR>

nnoremap <Leader>ggr :GitGutterUndoHunk<CR>
nnoremap <Leader>ggs :GitGutterStageHunk<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gs :Gstatus<CR>

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nnoremap <silent> gC gc
nnoremap <silent> gc gC
xnoremap <silent> gC gc
xnoremap <silent> gc gC

" Plugin settings.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:clang_format#detect_style_file = 1
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_space = 1
let g:delimitMate_matchpairs = "(:),[:],{:}"
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
let g:markdown_fenced_languages = ['cpp', 'objc', 'objcpp']
let g:rooter_manual_only = 1
let g:rustfmt_autosave = 1
let g:table_mode_corner_corner = '+'
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_show_visibility = 1
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:vimtex_fold_enabled = 0
let g:vimtex_imaps_enabled = 0

" Deoplete settings.
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 200

" Deoplete settings for plugins.
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

" LSP settings.
let g:LanguageClient_serverCommands = {
      \ 'cpp': [
      \      'cquery',
      \      '--log-file=/tmp/cquery.log',
      \      '--init={ "cacheDirectory": "/tmp/cquery" }'
      \ ],
      \ 'python': ['pyls'],
      \ 'rust': ['rls'],
      \ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_changeThrottle = 0.2
let g:LanguageClient_diagnosticsDisplay =
            \ {
            \     1: {
            \         "name": "Error",
            \         "texthl": "ALEError",
            \         "signText": "E",
            \         "signTexthl": "ALEErrorSign",
            \     },
            \     2: {
            \         "name": "Warning",
            \         "texthl": "ALEWarning",
            \         "signText": "W",
            \         "signTexthl": "ALEWarningSign",
            \     },
            \     3: {
            \         "name": "Information",
            \         "texthl": "ALEInfo",
            \         "signText": "i",
            \         "signTexthl": "ALEInfoSign",
            \     },
            \     4: {
            \         "name": "Hint",
            \         "texthl": "ALEInfo",
            \         "signText": "h",
            \         "signTexthl": "ALEInfoSign",
            \     },
            \ }

augroup lsp_options
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

" LSP mappings.
nnoremap <silent> gA :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>

" Hack for LSP + deoplete + UltiSnips.
let g:ulti_expand_res = 0
function! CompleteSnippet()
    if empty(v:completed_item)
        return
    endif

    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res > 0
        return
    endif

    let l:complete = type(v:completed_item) == v:t_dict ? v:completed_item.word : v:completed_item
    let l:comp_len = len(l:complete)

    let l:cur_col = mode() == 'i' ? col('.') - 2 : col('.') - 1
    let l:cur_line = getline('.')

    let l:start = l:comp_len <= l:cur_col ? l:cur_line[:l:cur_col - l:comp_len] : ''
    let l:end = l:cur_col < len(l:cur_line) ? l:cur_line[l:cur_col + 1 :] : ''

    call setline('.', l:start . l:end)
    call cursor('.', l:cur_col - l:comp_len + 2)

    call UltiSnips#Anon(l:complete)
endfunction

augroup completion
    autocmd!
    autocmd BufEnter * call ncm2#enable_for_buffer()
    autocmd CompleteDone * call CompleteSnippet()
augroup END

" LightLine settings.
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
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

" Show non-ASCII characters.
highlight nonascii guibg=Red ctermbg=1 term=standout
autocmd BufReadPost * syntax match nonascii "[^\u0000-\u007F]"

" Language-specific groups.
augroup filetype_c
    autocmd!
    autocmd FileType c nnoremap <buffer> <Leader>vh :vsp %<.h<CR>
    autocmd FileType c nnoremap <buffer> <Leader>xh :sp %<.h<CR>
    autocmd FileType c nnoremap <buffer> <Leader>vc :vsp %<.c<CR>
    autocmd FileType c nnoremap <buffer> <Leader>xc :sp %<.c<CR>
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp nnoremap <buffer> <Leader>vh :vsp %<.h<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xh :sp %<.h<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vc :vsp %<.cc<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xc :sp %<.cc<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vH :vsp %<.hpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xH :sp %<.hpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>vC :vsp %<.cpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>xC :sp %<.cpp<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>mh yy2pkI#ifndef <Esc>jI#define <Esc>jI#endif // <Esc>2O<Esc>O<Esc>
    autocmd FileType cpp nnoremap <buffer> <Leader>cf :ClangFormat<CR>
    autocmd FileType cpp nnoremap <buffer> <Leader>cF :ClangFormatAutoToggle<CR>
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

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal sts=4 sw=4 ts=4
    autocmd Filetype markdown let delimitMate_quotes="\" '"
augroup END

augroup filetype_python
    autocmd!
    autocmd Filetype python let delimitMate_quotes="'"
augroup END

augroup filetype_tex
    autocmd!
    autocmd BufEnter *.tex setlocal filetype=tex
    autocmd FileType tex setlocal foldmethod=marker
    autocmd FileType tex setlocal colorcolumn=80 spell
    autocmd FileType tex nnoremap <buffer> <F8> :VimtexTocToggle<CR>
    autocmd FileType tex nnoremap <buffer> <Leader>tw gqip
    autocmd FileType tex let delimitMate_matchpairs="(:),[:],{:},`:'"
    autocmd Filetype tex let delimitMate_quotes="\" '"
    autocmd FileType tex imap <buffer> ]] <Plug>(vimtex-delim-close)
    autocmd FileType tex nnoremap <buffer> )) <Plug>(vimtex-delim-toggle-modifier)
    autocmd FileType tex nnoremap <buffer> cE <Plug>(vimtex-env-change)
    autocmd FileType tex nnoremap <buffer> ]] <Plug>(vimtex-]])
    autocmd FileType tex nnoremap <buffer> ][ <Plug>(vimtex-][)
    autocmd FileType tex nnoremap <buffer> [] <Plug>(vimtex-[])
    autocmd FileType tex nnoremap <buffer> [[ <Plug>(vimtex-[[)
augroup END

if s:nvim
    augroup terminal
        autocmd!
        autocmd TermOpen * setlocal nonumber norelativenumber
        autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
    augroup END
end