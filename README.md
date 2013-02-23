[![Build Status](https://travis-ci.org/nelstrom/vim-docopen.png)](https://travis-ci.org/nelstrom/vim-docopen)

This plugin lets you quickly jump from Vim's built-in documentation to the online help in the browser. For example, run:

    :help
    :DocOpen

Vim will launch the [`help.txt`](http://vimdoc.sourceforge.net/htmldoc/help.html#help.txt) resource in your browser. If your cursor is positioned on a helptag, then the `:DocOpen` command will link to the specified helptag. If the cursor is not on a helptag, then `:DocOpen` will open the current helpfile.
