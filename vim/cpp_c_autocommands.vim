augroup cpp_c_config
  autocmd!
  autocmd FileType cpp,c nnoremap <buffer><Leader>c I// <esc>
  autocmd FileType cpp,c inoremap <buffer> < <><left>
  autocmd FileType cpp,c inoremap <buffer> > <><left>
  autocmd FileType cpp,c inoremap <buffer> <Leader>if if(%)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType cpp,c inoremap <buffer> <Leader>for for(%)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType cpp,c inoremap <buffer> <Leader>fir for(int i=0; i %; i++)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType cpp,c inoremap <buffer> #inc #include 
  autocmd FileType cpp,c inoremap <buffer> cout cout << % << endl;<esc>F%s
  autocmd FileType cpp,c setlocal shiftwidth=4
  autocmd FileType cpp,c autocmd BufWritePost <buffer> silent! !ctags -R --exclude='node_modules' --exclude='dist' --exclude='static' --exclude='__pycache__' --exclude='*.pyc' --exclude='*.html' --exclude='*.py' --exclude='~build' --exclude='*.json' --exclude='build' --exclude='lib' --exclude='lib64'--exclude='venv' --exclude='*.out' --exclude='*.js' --exclude='*.jsx' 2>/dev/null -f ctags . &
augroup END
