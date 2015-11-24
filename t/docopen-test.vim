silent filetype plugin on
help
" call vspec#hint({'scope': 'help#docopen#scope()', 'sid': 'help#docopen#sid()'})

describe 'help#GetFilename'

  it 'gets name of current helpfile'
    help
    Expect help#docopen#GetFilename() ==# 'help'
    help j
    Expect help#docopen#GetFilename() ==# 'motion'
    help usr_01
    Expect help#docopen#GetFilename() ==# 'usr_01'
  end

end

describe 'help#GetHelptag'

  it 'gets the helptag under the cursor'
    help j
    Expect help#docopen#GetHelptag() ==# 'j'
    help search-offset
    Expect help#docopen#GetHelptag() ==# 'search-offset'
    help {offset}
    Expect help#docopen#GetHelptag() ==# '{offset}'
    help /\&
    Expect help#docopen#GetHelptag() ==# '/\&'
    help '
    Expect help#docopen#GetHelptag() ==# "'"
    help "
    Expect help#docopen#GetHelptag() ==# "quote"
  end

  it 'returns a blank string when cursor is not on a helptag'
    help
    normal W
    Expect help#docopen#GetHelptag() ==# ''
    normal }
    Expect help#docopen#GetHelptag() ==# ''
    normal G
    Expect help#docopen#GetHelptag() ==# ''
  end

end

describe 'help#GenarateUrl'

  it 'generates an URL from specified filename and helptag'
    Expect help#docopen#RawUrl('foo', 'bar') ==# 'http://vimhelp.appspot.com/foo.txt.html#bar'
  end

  it 'generates an URL from specified filename given a blank helptag'
    Expect help#docopen#RawUrl('foo', '') ==# 'http://vimhelp.appspot.com/foo.txt.html'
  end

  it 'generates an URL from specified filename'
    Expect help#docopen#RawUrl('foo') ==# 'http://vimhelp.appspot.com/foo.txt.html'
  end

  it 'generates an URL from contextual filename'
    help
    " Jump to the first blank line (so there's no helptag beneath cursor)
    normal! }
    Expect help#docopen#RawUrl(help#docopen#GetFilename(), help#docopen#GetHelptag()) ==# 'http://vimhelp.appspot.com/help.txt.html'
  end

  it 'generates an URL from contextual filename and helptag'
    help j
    Expect help#docopen#RawUrl(help#docopen#GetFilename(), help#docopen#GetHelptag()) ==# 'http://vimhelp.appspot.com/motion.txt.html#j'
  end

end

describe 'ygd'

  before
    call setreg('"', '')
    call setreg('a', '')
    help j
  end

  it 'sets the default register to a help URL'
    normal ygd
    Expect @@ ==# 'http://vimhelp.appspot.com/motion.txt.html#j'
  end

  it 'sets the specified register to a help URL'
    normal "aygd
    Expect @a ==# 'http://vimhelp.appspot.com/motion.txt.html#j'
  end

end

describe ':DocOpen'

  it 'command is defined for help files'
    setlocal filetype=help
    Expect exists(':DocOpen')  ==# 2
  end

  it 'command is not defined for non-help files'
    setlocal filetype=
    Expect exists(':DocOpen')  ==# 0
  end

end
