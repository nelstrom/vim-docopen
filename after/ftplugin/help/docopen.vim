command! -buffer DocOpen call help#docopen#OpenDocumentation()
nnoremap <buffer> gd :DocOpen<CR><CR>
nnoremap <buffer> ygd :call help#docopen#SetRegister()<CR>
let b:undo_ftplugin .= '| delcommand DocOpen'
