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
augroup END
