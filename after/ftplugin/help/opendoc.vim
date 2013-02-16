function! Filename()
  return expand('%:t:r')
endfunction

function! Helptag()
  return expand('<cword>')
endfunction

function! GenerateUrl(filename, ...)
  if a:0 == 1
    return 'http://vimdoc.sourceforge.net/htmldoc/' . a:filename . '.html#' . a:1
  else
    return 'http://vimdoc.sourceforge.net/htmldoc/' . a:filename . '.html'
  endif
endfunction
