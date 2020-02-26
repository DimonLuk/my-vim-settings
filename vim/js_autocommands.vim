augroup javascript_config
  autocmd!
  function! s:RunJest()
    let filepath = expand("%:p")
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    execute 'read !jest '.filepath
    execute 'normal! ggdd'
  endfunction
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer><Leader>< <% /><esc>F%s
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer><Leader>> <% ><esc>F%xs
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer>... { ...% }<esc>F%s
  autocmd FileType javascript,vue,javascript.jsx nnoremap <buffer><Leader>c I// <esc>
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> <Leader>if if(%)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> <Leader>for for(%)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> <Leader>fir for(int i=0; i %; i++)<esc>F%mqA {<esc>o}<esc>`qs
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> frim import % from <esc>F%s
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> pudb debugger;<esc>
  autocmd FileType javascript,vue,javascript.jsx inoremap <buffer> <Leader>log console.log();<left><left>
  autocmd FileType javascript,vue,javascript.jsx nnoremap <buffer> pudb mqOdebugger;<esc>`q
  autocmd FileType javascript,vue,javascript.jsx nnoremap <buffer> <Leader>log oconsole.log();<esc>hi
  autocmd FileType javascript,vue,javascript.jsx nnoremap <buffer> <Leader>pr :CocCommand prettier.formatFile<CR>
  autocmd FileType javascript,vue,javascript.jsx autocmd BufWritePost <buffer> silent! !ctags -R --exclude='node_modules' --exclude='dist' --exclude='static' --exclude='__pycache__' --exclude='*.pyc' --exclude='*.html' --exclude='*.py' --exclude='~build' --exclude='*.json' --exclude='build' --exclude='lib' --exclude='lib64'--exclude='venv' --exclude='*.cpp' --exclude='*.c' --exclude='*.out' --exclude='*.o' 2>/dev/null -f jstags . &
  autocmd FileType javascript,vue,javascript.jsx nnoremap <buffer><Leader>gt :call <SID>RunJest()<cr>
  autocmd BufWritePre *.js execute ':CocCommand prettier.formatFile'
  autocmd BufWritePre *.jsx execute ':CocCommand prettier.formatFile'
augroup END
