command! -buffer DocOpen call help#docopen#OpenDocumentation()
nnoremap <buffer> gd :DocOpen<CR><CR>
let b:undo_ftplugin .= '| delcommand DocOpen'
