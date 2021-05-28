"Fish does not work well with nvim, e.g. :Tutor segfaults with fish ;)"
set shell=/bin/bash
let mapleader = "\<Space>"

set nocompatible
syntax on
set number
set autoindent
set noshowmode
set relativenumber
set hidden

set nobackup
set nowritebackup

set cmdheight=2
set updatetime=300
set shortmess+=c

set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

noremap ; l
noremap l k
noremap k j
noremap j h

map J ^
map K $


" Ctrl+P for file selection
nnoremap <C-p> :Files<Cr>

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-rooter'
Plug 'leafgarland/typescript-vim'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'lervag/vimtex'
Plug 'ekalinin/Dockerfile.vim'

call plug#end()

let g:coc_global_extensions = ['coc-tsserver', 'coc-go', 'coc-json', 'coc-python']

let g:airline_theme='powerlineish'

autocmd vimenter * colorscheme gruvbox

let g:rooter_patterns = ['main.tex', 'package.json', 'Pipfile', 'go.mod', '.git/']
autocmd vimenter * :Rooter

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

let g:vimtex_compiler_progname = 'nvr'
