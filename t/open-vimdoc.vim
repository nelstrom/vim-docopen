silent filetype plugin on

describe 'help#Filename'

  it 'gets name of current helpfile'
    help
    Expect Filename() == 'help'
  end

end
