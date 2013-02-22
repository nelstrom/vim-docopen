silent filetype plugin on
help
" call vspec#hint({'scope': 'docopen#scope()', 'sid': 'docopen#sid()'})

describe 'help#GetFilename'

  it 'gets name of current helpfile'
    help
    Expect docopen#GetFilename() ==# 'help'
    help j
    Expect docopen#GetFilename() ==# 'motion'
    help usr_01
    Expect docopen#GetFilename() ==# 'usr_01'
  end

end

describe 'help#GetHelptag'

  it 'gets the helptag under the cursor'
    help j
    Expect docopen#GetHelptag() ==# 'j'
    help search-offset
    Expect docopen#GetHelptag() ==# 'search-offset'
    help {offset}
    Expect docopen#GetHelptag() ==# '{offset}'
    help /\&
    Expect docopen#GetHelptag() ==# '/\&'
    help '
    Expect docopen#GetHelptag() ==# "'"
    help "
    Expect docopen#GetHelptag() ==# "quote"
  end

  it 'returns a blank string when cursor is not on a helptag'
    help
    normal W
    Expect docopen#GetHelptag() ==# ''
    normal }
    Expect docopen#GetHelptag() ==# ''
    normal G
    Expect docopen#GetHelptag() ==# ''
  end

end

describe 'help#GenarateUrl'

  it 'generates an URL from specified filename and helptag'
    Expect docopen#RawUrl('foo', 'bar') ==# 'http://vimdoc.sourceforge.net/htmldoc/foo.html#bar'
  end

  it 'generates an URL from specified filename given a blank helptag'
    Expect docopen#RawUrl('foo', '') ==# 'http://vimdoc.sourceforge.net/htmldoc/foo.html'
  end

  it 'generates an URL from specified filename'
    Expect docopen#RawUrl('foo') ==# 'http://vimdoc.sourceforge.net/htmldoc/foo.html'
  end

  it 'generates an URL from contextual filename'
    help
    " Jump to the first blank line (so there's no helptag beneath cursor)
    normal! }
    Expect docopen#RawUrl(docopen#GetFilename(), docopen#GetHelptag()) ==# 'http://vimdoc.sourceforge.net/htmldoc/help.html'
  end

  it 'generates an URL from contextual filename and helptag'
    help j
    Expect docopen#RawUrl(docopen#GetFilename(), docopen#GetHelptag()) ==# 'http://vimdoc.sourceforge.net/htmldoc/motion.html#j'
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
