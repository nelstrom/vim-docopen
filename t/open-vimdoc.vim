silent filetype plugin on

describe 'help#filename'

  it 'gets name of current helpfile'
    help
    Expect Filename() == 'help.txt'
  end

end
