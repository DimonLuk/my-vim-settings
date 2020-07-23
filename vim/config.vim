let g:python_highlight_all = 1
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
filetype plugin on
syntax on
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set tags=tags;
highlight ColorColumn ctermbg=gray
set tags+=./jstags;
set tags+=./pytags;
set tags+=./ctags;
set tags+=./javatags;
set relativenumber
set cursorcolumn
hi CursorColumn ctermbg=24
set cursorline
hi CursorLine ctermbg=24
set foldmethod=indent
set foldignore=
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
hi clear SignColumn
