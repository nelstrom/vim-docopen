command! -buffer DocOpen call help#docopen#OpenDocumentation()
nnoremap <buffer> gx :call help#docopen#OpenDocumentation()<CR><CR>
let b:undo_ftplugin .= '| delcommand DocOpen'
