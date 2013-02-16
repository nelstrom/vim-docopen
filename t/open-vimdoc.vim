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

describe 'help#Helptag'

  it 'gets the helptag under the cursor'
    help j
    Expect Helptag() == 'j'
    help search-offset
    Expect Helptag() == 'search-offset'
    help {offset}
    Expect Helptag() == '{offset}'
    help /\&
    Expect Helptag() == '/\&'
  end

end
