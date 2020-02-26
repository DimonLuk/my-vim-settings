nnoremap <silent> <Leader><space>y :<C-u>CocList -A --normal yank<cr>
nnoremap <C-\>p :buffer #<cr>
inoremap <C-\>p <esc>:w<cr>:buffer #<cr>
nnoremap <C-\>l :buffers<cr>
inoremap <C-\>l <esc>:buffers<cr>
nnoremap <Leader>cc :set operatorfunc=<SID>ToggleSnakeAndCamelCase<cr>g@
vnoremap <Leader>cc :<c-u>call <SID>ToggleSnakeAndCamelCase(visualmode())<cr>
nnoremap <Leader>t :call <SID>ToggleBoolean()<cr>
nnoremap <Leader>W :W<cr>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-[> :FuzzyOpen<CR>
nnoremap <C-q> :tab sp<CR>
nnoremap <C-c> :vsp<CR>
nnoremap <C-h> :History<CR>
nnoremap <space> viw
nnoremap / /\v
nnoremap ? ?\v
nnoremap j gj
nnoremap k gk
nnoremap <C-s> :FuzzyGrep<cr>
nnoremap <Leader>l mq/\v^$<cr>
nnoremap <Leader>s mq:%s/\v(\s+)$//g<cr>`q
nnoremap <Leader>; mqA;<esc>`q
nnoremap <Leader>: mqA:<esc>`q
nnoremap <Leader>, mqA,<esc>`q
nnoremap <Leader>p mqea.<esc>`q
nnoremap <Leader>P mqEa.<esc>`q
nnoremap <Leader>x mq$x`q
nnoremap <Leader>uu mqu`q
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <Leader>ooo mqo<esc>kO<esc>`q
nnoremap <Leader>o mqo<esc>`q
nnoremap <Leader>O mqO<esc>`q
inoremap <C-d> <esc>cc
inoremap { { % }<esc>F%s
inoremap } {}<esc>i
inoremap [ []<esc>i
inoremap ] []<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ` ``<esc>i
inoremap ( ()<esc>i
inoremap ) ()<esc>i
nnoremap <Leader>w :w<cr><c-w>j:q<cr>
nnoremap <Leader>k gUl
nnoremap <Leader>j gul
nnoremap <Leader>U viwgU
nnoremap <Leader>u viwgu
nnoremap <Leader>ev :vsplit $MYVIMRC<cr><c-w>l:q<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>
nnoremap <Leader>d ddO
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>q :tab sp<CR>
nnoremap <Leader>f :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <Leader>f :<c-u>call <SID>GrepOperator(visualmode())<cr>
nnoremap <Leader>-d :let d = getcwd()<cr>
nnoremap <Leader>-- :execute 'cd' d<cr>
