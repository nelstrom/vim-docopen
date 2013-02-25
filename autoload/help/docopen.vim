" function! help#docopen#scope()
"   return s:
" endfunction

" function! help#docopen#sid()
"   return maparg('<SID>', 'n')
" endfunction

function! help#docopen#GetFilename()
  return expand('%:t:r')
endfunction

function! help#docopen#GetHelptag()
  let word = expand('<cWORD>')
  let stripped = substitute(word, '\v^\*([^*]*)\*$', '\1', 'g')
  if word !=# stripped
    return stripped
  else
    return ''
  endif
endfunction

function! help#docopen#RawUrl(filename, ...)
  if a:0 ==# 1 && a:1 !=# ''
    return 'http://vimdoc.sourceforge.net/htmldoc/' . a:filename . '.html#' . a:1
  else
    return 'http://vimdoc.sourceforge.net/htmldoc/' . a:filename . '.html'
  endif
endfunction

function! help#docopen#SetRegister()
  let url = help#docopen#RawUrl(help#docopen#GetFilename(), help#docopen#GetHelptag())
  call setreg(v:register, url)
endfunction

function! help#docopen#OpenDocumentation()
  execute '!open ' . shellescape(help#docopen#RawUrl(help#docopen#GetFilename(), help#docopen#GetHelptag()), 1)
endfunction
