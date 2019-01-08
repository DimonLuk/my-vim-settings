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
function GetFilepath()
  return @%
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
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
map <C-[> :FZF<CR>
map <C-q> :tab sp<CR>
map <C-c> :vsp<CR>
map <C-h> :History<CR>
map <space> viw
nnoremap <C-s> :Ack! --ignore-file=is:pytags --ignore-file=is:tags --ignore-dir=~build<Space>
nnoremap j gj
nnoremap k gk
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
set colorcolumn=80
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
