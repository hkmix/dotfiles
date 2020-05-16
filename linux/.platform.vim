" Language server protocol.
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() }}

set signcolumn=yes

let g:SuperTabDefaultCompletionType="<c-n>"
let g:coc_global_extensions = [
            \ 'coc-eslint',
            \ 'coc-tsserver',
            \ 'coc-tslint-plugin',
            \ 'coc-rls',
            \ 'coc-python',
            \ 'coc-json',
            \ ]
let g:coc_snippet_next="<TAB>"
let g:coc_snippet_prev="<S-TAB>"
let g:coc_filetype_map = {
            \ 'hh': 'cpp',
            \ 'tpp': 'cpp',
            \ }

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gF :call CocAction('fold')<CR>
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" vim: sw=4
