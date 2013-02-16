silent filetype plugin on

describe 'help#GetFilename'

  it 'gets name of current helpfile'
    help
    Expect GetFilename() == 'help'
    help j
    Expect GetFilename() == 'motion'
    help usr_01
    Expect GetFilename() == 'usr_01'
  end

end

describe 'help#GetHelptag'

  it 'gets the helptag under the cursor'
    help j
    Expect GetHelptag() == 'j'
    help search-offset
    Expect GetHelptag() == 'search-offset'
    help {offset}
    Expect GetHelptag() == '{offset}'
    help /\&
    Expect GetHelptag() == '/\&'
  end

end

describe 'help#GenarateUrl'

  it 'generates an URL from specified filename and helptag'
    Expect GenerateUrl('foo', 'bar') == 'http://vimdoc.sourceforge.net/htmldoc/foo.html#bar'
  end

  it 'generates an URL from specified filename given a blank helptag'
    Expect GenerateUrl('foo', '') == 'http://vimdoc.sourceforge.net/htmldoc/foo.html'
  end

  it 'generates an URL from specified filename'
    Expect GenerateUrl('foo') == 'http://vimdoc.sourceforge.net/htmldoc/foo.html'
  end

end
