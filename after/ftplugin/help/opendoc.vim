function! Filename()
  return expand('%:t:r')
endfunction

function! Helptag()
  return expand('<cword>')
endfunction

function! GenerateUrl(filename, helptag)
  return 'http://vimdoc.sourceforge.net/htmldoc/' . a:filename . '.html#' . a:helptag
endfunction
