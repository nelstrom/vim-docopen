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

describe 'help#GenarateUrl'

  it 'generates an URL from specified filename and helptag'
    Expect GenerateUrl('foo', 'bar') == 'http://vimdoc.sourceforge.net/htmldoc/foo.html#bar'
  end

  it 'generates an URL from specified filename'
    Expect GenerateUrl('foo') == 'http://vimdoc.sourceforge.net/htmldoc/foo.html'
  end

end
