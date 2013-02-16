[![Build Status](https://travis-ci.org/nelstrom/vim-docopen.png)](https://travis-ci.org/nelstrom/vim-docopen)

Specification:

* create a :Vimdoc command that opens online documentation for current helptag
* only define the :Vimdoc command in buffers where filetype=help
* generate a URL from the current helptag and helpfile
* run: :help j opens helpfile: motion.txt, at helptag: j
* run: :help j then :Vimdoc opens url: http://vimdoc.sourceforge.net/htmldoc/motion.html#j
* format: http://vimdoc.sourceforge.net/htmldoc/{FILENAME}.html#{HELPTAG}
* if there's no helptag under the cusor, open http://vimdoc.sourceforge.net/htmldoc/{FILENAME}.html
* specifically: only treat word below cursor as a helptag if it's surrounded in *stars*
* make the :Vimdoc command the only public interface (i.e. make all functions use scope s: )
