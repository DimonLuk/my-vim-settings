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
