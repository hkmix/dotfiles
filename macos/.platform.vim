" Language server protocol.
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() }}

augroup LSP
    autocmd!
    " Should eventually use `setlocal` but currently CoC is not activated on a
    " buffer-specific basis.
    autocmd User CocNvimInit set signcolumn=yes
augroup END

let g:coc_snippet_next="<TAB>"
let g:coc_snippet_prev="<S-TAB>"
