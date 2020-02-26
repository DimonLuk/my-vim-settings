augroup general_stuff
  autocmd!
  autocmd ColorScheme * hi Normal ctermbg=none
  autocmd FileType javascript,javascript.jsx,vue,python,c,cpp,java autocmd BufWritePre <buffer> execute 'normal! mq'|execute '%s/\v(\s+)$//e'|execute 'normal! `q'
  autocmd VimResized * wincmd =
augroup END
