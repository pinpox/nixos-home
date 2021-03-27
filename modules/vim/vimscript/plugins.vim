" Plugin options


" Switch
let g:switch_custom_definitions =
			\ [
			\   ['foo', 'bar', 'baz'],
			\   [ 'on', 'off'],
			\   ['_', '#'],
			\   ['LOW', 'HIGH']
			\ ]


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


" disable concellevel for markdown
let g:vim_markdown_conceal = 0

" Terraform options
let g:terraform_align=1
let g:terraform_fmt_on_save=1




" autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" autocmd! FileType which_key
" autocmd  FileType which_key set laststatus=0 noshowmode noruler
" 			\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler



" nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
" vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>


" Set timeout, e.g. used in whichkey
set timeoutlen=500





nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>


" packadd! vim-which-key " Needed so that vim-which-key functions are available here
call which_key#register('<Space>', 'g:which_key_map')

set inccommand=nosplit

