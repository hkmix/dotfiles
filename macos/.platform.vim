" Language server protocol.
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() }}
Plug 'rhysd/vim-clang-format'

augroup LSP
    autocmd!
    " Should eventually use `setlocal` but currently CoC is not activated on a
    " buffer-specific basis.
    autocmd User CocNvimInit set signcolumn=yes
augroup END

let g:SuperTabDefaultCompletionType="<c-n>"
let g:clang_format#detect_style_file=1
let g:coc_snippet_next="<TAB>"
let g:coc_snippet_prev="<S-TAB>"
let g:coc_filetype_map = {
            \ 'hh': 'cpp',
            \ 'tpp': 'cpp',
            \ }

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gf :ClangFormat<CR>
nmap <silent> gF :call CocAction('fold')<CR>
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
