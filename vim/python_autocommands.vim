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
  autocmd FileType python inoremap <buffer> <Leader>if if %:<esc>F%s
  autocmd FileType python inoremap <buffer> <Leader>for for % in:<esc>F%s
  autocmd FileType python inoremap <buffer> frim from % import <esc>F%s
  autocmd FileType python inoremap <buffer> pudb import pudb; pudb.set_trace() # NOQA<esc>
  autocmd FileType python inoremap <buffer> tleep import time; time.sleep(1000) # NOQA<esc>
  autocmd FileType python inoremap <buffer> <Leader>log print(%)<esc>F%s
  autocmd FileType python nnoremap <buffer> pudb mqOimport pudb; pudb.set_trace() # NOQA<esc>`q
  autocmd FileType python nnoremap <buffer> tleep mqOimport time; time.sleep(1000) # NOQA<esc>`q
  autocmd FileType python nnoremap <buffer> <Leader>log oprint(%)<esc>F%s
  autocmd FileType python setlocal colorcolumn=79
  autocmd Filetype python nnoremap <buffer><Leader>OO O<esc>O<esc>O
  autocmd Filetype python nnoremap <buffer><Leader>oo o<cr><cr>
  autocmd FileType python nnoremap <buffer><Leader>gg :call <SID>RunPython()<cr>
  autocmd FileType python nnoremap <buffer><Leader>gt :call <SID>RunPyTest()<cr>
  autocmd FileType python autocmd BufWritePost <buffer> silent! !ctags -R --exclude='node_modules' --exclude='*.jsx' --exclude='*.js' --exclude='dist' --exclude='static' --exclude='__pycache__' --exclude='*.pyc' --exclude='*.html' --exclude='*.css' --exclude='~build' --exclude='*.json' --exclude='build' --exclude='lib' --exclude='lib64' --exclude='venv' --exclude='*.cpp' --exclude='*.c' --exclude='*.out' --exclude='*.o' -f pytags 2>/dev/null . &
  "autocmd BufWritePre *.py execute ':Black'
  "command W execute ':Black' | execute ':w'
  command W execute ':w' | execute 'silent !black --line-length 79 ' . expand('%:p') | execute ':e'
augroup END
