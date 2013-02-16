function! Filename()
  return expand('%:t:r')
endfunction

function! Helptag()
  return expand('<cword>')
endfunction
