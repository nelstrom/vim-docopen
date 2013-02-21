function! GetFilename()
  return expand('%:t:r')
endfunction

function! GetHelptag()
  let word = expand('<cWORD>')
  let stripped = substitute(word, '\v^\*([^*]*)\*$', '\1', 'g')
  if word !=# stripped
    return stripped
  else
    return ''
  endif
endfunction

function! RawUrl(filename, ...)
  if a:0 ==# 1 && a:1 !=# ''
    return 'http://vimdoc.sourceforge.net/htmldoc/' . a:filename . '.html#' . a:1
  else
    return 'http://vimdoc.sourceforge.net/htmldoc/' . a:filename . '.html'
  endif
endfunction

function! OpenDocumentation()
  execute '!open "' . escape(RawUrl(GetFilename(), GetHelptag()), '#') . '"'
endfunction
command! -buffer Vimdoc call OpenDocumentation()

" Teardown
let b:undo_ftplugin .= '| delcommand Vimdoc'
