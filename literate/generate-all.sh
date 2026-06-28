#!/bin/sh

# Tangle
inweb tangle literate::vimrc -using literate/vimscript.inweb -to vimfiles/vimrc
inweb tangle literate::gvimrc -using literate/vimscript.inweb -to vimfiles/gvimrc
inweb tangle literate::python.vim -using literate/vimscript.inweb -to vimfiles/after/ftplugin/python.vim

# Weave
# FIXME: Inweb allows you to specify the output directory with the command
#        line option -to and the colony member parameter to:
#
#        However, in the current version I can't come up with any combination
#        that puts all the files in the correct place. Specifying inside the
#        colony just affects the locations within the `docs` directory, and
#        specifying at the command line results in the various vimrc section
#        files being placed *outside* the vimrc directory.
#
#        I think this might be a bug in Inweb. Hacky workaround is to allow
#        weaving to the default location but move it after.
#
#        N.B. We ARE using colony to: to change the location of the
#        gvimrc.html and python.html files, which results in empty directories
#        being created alongside them, but that's acceptable for now, I think.
rm -r literate/html || exit 1
mkdir -p literate/docs/docs-assets
mkdir -p literate/docs/vimrc
mkdir -p literate/docs/gvimrc
mkdir -p literate/docs/after/ftplugin/python
inweb weave literate -using literate/vimscript.inweb -using literate/Patterns
mv literate/docs literate/html
