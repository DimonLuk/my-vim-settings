augroup java
  autocmd!
  function! s:RunJava()
    let filepath = expand("%:p")
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    execute 'read !java '.filepath
    execute 'normal! ggdd'
  endfunction
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  nmap <F4> <Plug>(JavaComplete-Imports-Add)
  imap <F4> <Plug>(JavaComplete-Imports-Add)
  nmap <F5> <Plug>(JavaComplete-Imports-AddMissing)
  imap <F5> <Plug>(JavaComplete-Imports-AddMissing)
  nmap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
  imap <F6> <Plug>(JavaComplete-Imports-RemoveUnused)
  autocmd FileType java nnoremap <buffer><Leader>c I// <esc>
  autocmd FileType java nnoremap <buffer><Leader>gg :call <SID>RunJava()<cr>
  autocmd FileType java inoremap <buffer> <Leader>if if(%)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType java inoremap <buffer> <Leader>for for(%)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType java inoremap <buffer> <Leader>fir for(int i=0; i %; i++)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType java setlocal shiftwidth=4
  autocmd FileType java autocmd BufWritePost <buffer> silent! !ctags -R --exclude='node_modules' --exclude='dist' --exclude='static' --exclude='__pycache__' --exclude='*.pyc' --exclude='*.html' --exclude='*.py' --exclude='~build' --exclude='*.json' --exclude='build' --exclude='lib' --exclude='lib64'--exclude='venv' --exclude='*.out' --exclude='*.js' --exclude='*.jsx' 2>/dev/null -f javatags . &
augroup END
