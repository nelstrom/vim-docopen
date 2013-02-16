describe 'help#filename'

  it 'gets name of current helpfile'
    help
    Expect expand('<cfile>') == 'help.txt'
  end

end
