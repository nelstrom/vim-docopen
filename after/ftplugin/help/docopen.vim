function! OpenDocumentation()
  execute '!open "' . escape(help#docopen#RawUrl(help#docopen#GetFilename(), help#docopen#GetHelptag()), '#') . '"'
endfunction
command! -buffer DocOpen call OpenDocumentation()

" Teardown
let b:undo_ftplugin .= '| delcommand DocOpen'
