call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'tell-k/vim-autopep8'
Plug 'nvie/vim-flake8'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'mileszs/ack.vim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'rhysd/vim-wasm'
call plug#end()
function! GetFilepath()
  return expand("%:p")
endfunction
function! s:ToggleSnakeAndCamelCase(type)
  let unnamed_register = @@
  let yank_register = @0
  let camel_case = '\v(\u)'
  let snake_case = '\v_(\l)'
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  if @@ =~? camel_case
    let @@ = substitute(@@, camel_case, '_\l\1', "ge")
  elseif @@ =~? snake_case
    let @@ = substitute(@@, snake_case, '\u\1', "ge")
  endif
  normal! gvp

  let @@ = unnamed_register
  let @0 = yank_register
endfunction
function! s:GrepOperator(type)
  let unnamed_register = @@
  let yank_register = @0
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  silent execute "grep! -R ".shellescape(@@)." ."
  copen

  let @@ = unnamed_register
  let @0 = yank_register
endfunction
function! s:ToggleBoolean()
  let saved_register = @@
  let yank_register = @0
  normal! mqyiw
  if @@ ==# "true"
    let @@ = "false"
  elseif @@ ==# "false"
    let @@ = "true"
  elseif @@ ==# "True"
    let @@ = "False"
  elseif @@ ==# "False"
    let @@ = "True"
  endif
  normal! `[v`]p`q
  let @@ = saved_register
  let @0 = yank_register
endfunction
syntax enable
set background=dark
colorscheme solarized
let g:lightline = {
  \   'colorscheme': 'seoul256',
  \   'active': {
  \     'left': [['mode', 'paste'],
  \              ['readonly', 'filepath', 'modified']
  \             ],
  \     'right': [['lineinfo'],
  \              ['percent'],
  \              ['gitbranch', 'fileformat', 'filetype', 'fileencoding']
  \     ]
  \   },
  \   'inactive': {
  \     'left': [['mode', 'paste'],
  \              ['readonly', 'filepath', 'modified']
  \             ],
  \     'right': [['lineinfo'],
  \              ['percent'],
  \              ['gitbranch', 'fileformat', 'filetype', 'fileencoding']
  \     ]
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \     'filepath': 'GetFilepath'
  \   }
  \ }
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set tags=tags;
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1
" toggle candidate
nnoremap <C-\>p :buffer #<cr>
inoremap <C-\>p <esc>:w<cr>:buffer #<cr>
nnoremap <C-\>l :buffers<cr>
inoremap <C-\>l <esc>:buffers<cr>
nnoremap <Leader>cc :set operatorfunc=<SID>ToggleSnakeAndCamelCase<cr>g@
vnoremap <Leader>cc :<c-u>call <SID>ToggleSnakeAndCamelCase(visualmode())<cr>
nnoremap <Leader>t :call <SID>ToggleBoolean()<cr>
nnoremap <Leader>W :W<cr>
" toggle candidate ends
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-[> :FZF<CR>
nnoremap <C-q> :tab sp<CR>
nnoremap <C-c> :vsp<CR>
nnoremap <C-h> :History<CR>
nnoremap <space> viw
nnoremap / /\v
nnoremap ? ?\v
nnoremap j jg
nnoremap k gk
nnoremap <C-s> :Ack! --ignore-file=is:pytags --ignore-file=is:tags --ignore-dir=~build<Space>
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
highlight ColorColumn ctermbg=gray
set tags+=./jstags;
set tags+=./pytags;
iabbrev frim from % import <Esc>F%s<c-o>:call getchar()<CR>
set relativenumber
set cursorcolumn
hi CursorColumn ctermbg=24
set cursorline
hi CursorLine ctermbg=24
set foldmethod=indent
set foldignore=
let g:jsx_ext_required = 0


augroup general_staff
  autocmd!
  autocmd FileType javascript,javascript.jsx,vue,python autocmd BufWritePre <buffer> execute 'normal! mq'|execute '%s/\v(\s+)$//e'|execute 'normal! `q'
augroup END

augroup javascript_config
  autocmd!
  function! s:RunJest()
    let filepath = expand("%:p")
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    execute 'read !jest '.filepath
    execute 'normal! ggdd'
  endfunction
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer>< <% /><esc>F%s
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer>> <% ><esc>F%xs
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer>... { ...% }<esc>F%s
  autocmd FileType javascript,vue,javascript.jsx nnoremap <buffer><Leader>c I// <esc>
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> if if(%)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> for for(%)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> frim import % from <esc>F%s
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> pudb debugger;<esc>
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> log console.log();<left><left>
  autocmd FileType javascript,vue,javascript.jsx nnoremap <buffer> pudb mqOdebugger;<esc>`q
  autocmd FileType javascript,vue,javascript.jsx nnoremap <buffer> log oconsole.log();<esc>hi
  autocmd FileType javascript,vue,javascript.jsx autocmd BufWritePost <buffer> silent! !ctags -R --exclude='node_modules' --exclude='dist' --exclude='static' --exclude='__pycache__' --exclude='*.pyc' --exclude='*.html' --exclude='*.py' --exclude='~build' --exclude='*.json' --exclude='build' --exclude='lib' --exclude='lib64'--exclude='venv' 2>/dev/null -f jstags . &
  autocmd FileType javascript,vue,javascript.jsx nnoremap <buffer><Leader>gt :call <SID>RunJest()<cr>
augroup END

augroup python_config
  autocmd!
  function! s:RunPython()
    let filepath = expand("%:p")
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    execute 'read !python '.filepath
    execute 'normal! ggdd'
  endfunction
  function! s:RunPyTest()
    let filepath = expand("%:p")
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    execute 'read !pytest '.filepath
    execute 'normal! ggdd'
  endfunction
  autocmd FileType python nnoremap <buffer><Leader>c I# <esc>
  autocmd FileType python inoremap <buffer> if if %:<esc>F%s
  autocmd FileType python inoremap <buffer> for for % in:<esc>F%s
  autocmd FileType python inoremap <buffer> frim from % import <esc>F%s
  autocmd FileType python inoremap <buffer> pudb import pudb; pudb.set_trace() # NOQA<esc>
  autocmd FileType python inoremap <buffer> tleep import time; time.sleep(1000) # NOQA<esc>
  autocmd FileType python nnoremap <buffer> pudb mqOimport pudb; pudb.set_trace() # NOQA<esc>`q
  autocmd FileType python nnoremap <buffer> tleep mqOimport time; time.sleep(1000) # NOQA<esc>`q
  autocmd FileType python setlocal colorcolumn=80
  autocmd Filetype python nnoremap <buffer><Leader>OO O<esc>O<esc>O
  autocmd Filetype python nnoremap <buffer><Leader>oo o<cr><cr>
  autocmd FileType python nnoremap <buffer><Leader>gg :call <SID>RunPython()<cr>
  autocmd FileType python nnoremap <buffer><Leader>gt :call <SID>RunPyTest()<cr>
  autocmd FileType python autocmd BufWritePost <buffer> silent! !ctags -R --exclude='node_modules' --exclude='*.jsx' --exclude='*.js' --exclude='dist' --exclude='static' --exclude='__pycache__' --exclude='*.pyc' --exclude='*.html' --exclude='*.css' --exclude='~build' --exclude='*.json' --exclude='build' --exclude='lib' --exclude='lib64' --exclude='venv' -f pytags 2>/dev/null . &
augroup END
