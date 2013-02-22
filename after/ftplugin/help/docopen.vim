command! -buffer DocOpen call help#docopen#OpenDocumentation()
let b:undo_ftplugin .= '| delcommand DocOpen'
