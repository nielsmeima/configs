"Fish does not work well with nvim, e.g. :Tutor segfaults with fish ;)"
set shell=/bin/bash

syntax on
set number
set autoindent

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
