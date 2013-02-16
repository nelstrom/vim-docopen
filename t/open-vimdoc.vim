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

  it 'generates an URL from contextual filename'
    help
    " Jump to the first blank line (so there's no helptag beneath cursor)
    normal! }
    Expect GenerateUrl(GetFilename(), GetHelptag()) == 'http://vimdoc.sourceforge.net/htmldoc/help.html'
  end

  it 'generates an URL from contextual filename and helptag'
    help j
    Expect GenerateUrl(GetFilename(), GetHelptag()) == 'http://vimdoc.sourceforge.net/htmldoc/motion.html#j'
  end

end

describe ':Vimdoc'

  it 'command is defined for help files'
    setlocal filetype=help
    Expect exists(':Vimdoc')  == 2
  end

  it 'command is not defined for non-help files'
    setlocal filetype=
    Expect exists(':Vimdoc')  == 0
  end

end
