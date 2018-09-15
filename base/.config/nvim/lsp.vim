"  _                                        ____ _ _            _
" | |    __ _ _ __   __ _  __ _  __ _  ___ / ___| (_) ___ _ __ | |_
" | |   / _` | '_ \ / _` |/ _` |/ _` |/ _ \ |   | | |/ _ \ '_ \| __|
" | |__| (_| | | | | (_| | (_| | (_| |  __/ |___| | |  __/ | | | |_
" |_____\__,_|_| |_|\__, |\__,_|\__, |\___|\____|_|_|\___|_| |_|\__|
"                   |___/       |___/
"
" Optional packages and configurations for LanguageClient.

Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-abbrfuzzy'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-ultisnips'

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
    autocmd User LanguageClientStarted call ncm2#enable_for_buffer()
augroup END

" LSP mappings.
nnoremap <silent> gA :call LanguageClient_contextMenu()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
