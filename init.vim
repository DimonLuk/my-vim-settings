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
call plug#end()
function! GetFilepath()
  return expand("%:p")
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
nnoremap <C-s> :Ack! --ignore-file=is:pytags --ignore-file=is:tags --ignore-dir=~build<Space>
nnoremap j <nop>
nnoremap k <nop>
nnoremap h <nop>
nnoremap l <nop>
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
nnoremap <Leader>oo o<esc>kO<esc>j
nnoremap <Leader>o o<esc>k
nnoremap <Leader>O O<esc>j
inoremap <C-d> <esc>cc
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
highlight ColorColumn ctermbg=gray
set tags+=./jstags;
iabbrev pudb import pudb; pudb.set_trace() # NOQA
iabbrev tleep import time; time.sleep(1000) # NOQA
iabbrev <d <div class='%'></div><Esc>F%s<c-o>:call getchar()<CR>
iabbrev <s <div style='%'></div><Esc>F%s<c-o>:call getchar()<CR>
iabbrev frim from % import <Esc>F%s<c-o>:call getchar()<CR>
set relativenumber
set cursorcolumn
hi CursorColumn ctermbg=24
set cursorline
hi CursorLine ctermbg=24
set foldmethod=indent
set foldignore=


augroup general_staff
  autocmd!
  autocmd FileType javascript,vue,python autocmd BufWritePre <buffer> execute 'normal! mq'|execute '%s/\v(\s+)$//e'|execute 'normal! `q'
augroup END

augroup javascript_config
  autocmd!
  autocmd FileType javascript nnoremap <buffer><Leader>c I// <esc>
  autocmd FileType javascript :iabbrev <buffer> iff if()<left>
  autocmd FileType javascript :iabbrev <buffer> forr for()<left>
  autocmd FileType javascript :iabbrev <buffer> frim import from <left><left><left><left><left><left>
  autocmd FileType javascript :iabbrev <buffer> pudb debugger;<esc>
augroup END

augroup vue_config
  autocmd!
  autocmd FileType vue nnoremap <buffer><Leader>c I// <esc>
  autocmd FileType vue :iabbrev <buffer> iff if()<left>
  autocmd FileType vue :iabbrev <buffer> forr for()<left>
  autocmd FileType vue :iabbrev <buffer> frim import from <left><left><left><left><left><left>
  autocmd FileType vue :iabbrev <buffer> pudb debugger;<esc>
augroup END

augroup python_config
  autocmd!
  function! RunPython()
    let filepath = expand("%:p")
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    execute 'read !python '.filepath
    execute 'normal! ggdd'
  endfunction
  autocmd FileType python nnoremap <buffer><Leader>c I# <esc>
  autocmd FileType python :iabbrev <buffer> iff if:<left>
  autocmd FileType python :iabbrev <buffer> forr forin:<left><left><left>
  autocmd FileType python :iabbrev <buffer> frim from import <left><left><left><left><left><left><left><left>
  autocmd FileType python :iabbrev <buffer> pudb import pudb; pudb.set_trace() # NOQA
  autocmd FileType python setlocal colorcolumn=80
  autocmd Filetype python nnoremap <buffer><Leader>OO kkO<cr><cr>
  autocmd FileType python nnoremap <buffer><Leader>g :call RunPython()<cr>
augroup END
