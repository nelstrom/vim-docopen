silent filetype plugin on

describe 'help#Filename'

  it 'gets name of current helpfile'
    help
    Expect Filename() == 'help'
    help j
    Expect Filename() == 'motion'
    help usr_01
    Expect Filename() == 'usr_01'
  end

end
