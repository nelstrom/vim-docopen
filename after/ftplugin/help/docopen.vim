function! docopen#scope()
  return s:
endfunction

function! docopen#sid()
  return maparg('<SID>', 'n')
endfunction

function! docopen#GetFilename()
  return expand('%:t:r')
endfunction

function! docopen#GetHelptag()
  let word = expand('<cWORD>')
  let stripped = substitute(word, '\v^\*([^*]*)\*$', '\1', 'g')
  if word !=# stripped
    return stripped
  else
    return ''
  endif
endfunction

function! docopen#RawUrl(filename, ...)
  if a:0 ==# 1 && a:1 !=# ''
    return 'http://vimdoc.sourceforge.net/htmldoc/' . a:filename . '.html#' . a:1
  else
    return 'http://vimdoc.sourceforge.net/htmldoc/' . a:filename . '.html'
  endif
endfunction

function! OpenDocumentation()
  execute '!open "' . escape(docopen#RawUrl(docopen#GetFilename(), docopen#GetHelptag()), '#') . '"'
endfunction
command! -buffer DocOpen call OpenDocumentation()

" Teardown
let b:undo_ftplugin .= '| delcommand DocOpen'
