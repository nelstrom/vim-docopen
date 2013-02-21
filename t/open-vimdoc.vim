silent filetype plugin on
help
" call vspec#hint({'scope': 'opendoc#scope()', 'sid': 'opendoc#sid()'})

describe 'help#GetFilename'

  it 'gets name of current helpfile'
    help
    Expect opendoc#GetFilename() ==# 'help'
    help j
    Expect opendoc#GetFilename() ==# 'motion'
    help usr_01
    Expect opendoc#GetFilename() ==# 'usr_01'
  end

end

describe 'help#GetHelptag'

  it 'gets the helptag under the cursor'
    help j
    Expect opendoc#GetHelptag() ==# 'j'
    help search-offset
    Expect opendoc#GetHelptag() ==# 'search-offset'
    help {offset}
    Expect opendoc#GetHelptag() ==# '{offset}'
    help /\&
    Expect opendoc#GetHelptag() ==# '/\&'
    help '
    Expect opendoc#GetHelptag() ==# "'"
    help "
    Expect opendoc#GetHelptag() ==# "quote"
  end

  it 'returns a blank string when cursor is not on a helptag'
    help
    normal W
    Expect opendoc#GetHelptag() ==# ''
    normal }
    Expect opendoc#GetHelptag() ==# ''
    normal G
    Expect opendoc#GetHelptag() ==# ''
  end

end

describe 'help#GenarateUrl'

  it 'generates an URL from specified filename and helptag'
    Expect opendoc#RawUrl('foo', 'bar') ==# 'http://vimdoc.sourceforge.net/htmldoc/foo.html#bar'
  end

  it 'generates an URL from specified filename given a blank helptag'
    Expect opendoc#RawUrl('foo', '') ==# 'http://vimdoc.sourceforge.net/htmldoc/foo.html'
  end

  it 'generates an URL from specified filename'
    Expect opendoc#RawUrl('foo') ==# 'http://vimdoc.sourceforge.net/htmldoc/foo.html'
  end

  it 'generates an URL from contextual filename'
    help
    " Jump to the first blank line (so there's no helptag beneath cursor)
    normal! }
    Expect opendoc#RawUrl(opendoc#GetFilename(), opendoc#GetHelptag()) ==# 'http://vimdoc.sourceforge.net/htmldoc/help.html'
  end

  it 'generates an URL from contextual filename and helptag'
    help j
    Expect opendoc#RawUrl(opendoc#GetFilename(), opendoc#GetHelptag()) ==# 'http://vimdoc.sourceforge.net/htmldoc/motion.html#j'
  end

end

describe ':Vimdoc'

  it 'command is defined for help files'
    setlocal filetype=help
    Expect exists(':Vimdoc')  ==# 2
  end

  it 'command is not defined for non-help files'
    setlocal filetype=
    Expect exists(':Vimdoc')  ==# 0
  end

end
