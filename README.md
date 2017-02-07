[![Build Status](https://travis-ci.org/nelstrom/vim-docopen.png)](https://travis-ci.org/nelstrom/vim-docopen)

This plugin lets you quickly jump from Vim's built-in documentation to the online help in the browser. For example, run:

    :help
    :DocOpen

Vim will launch the [vimhelp.appspot.com/help.txt.html](http://vimhelp.appspot.com/help.txt.html) resource in your browser. NeoVim will use [neovim.io/doc/user/help.html](https://neovim.io/doc/user/help.html) instead.

If your cursor is positioned on a helptag, then the `:DocOpen` command will link to the specified helptag. If the cursor is not on a helptag, then `:DocOpen` will open the current helpfile.
