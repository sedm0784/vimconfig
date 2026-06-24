#!/bin/sh

inweb="$1"

if [ -z "$inweb" ]
then
  echo "Usage: literate/generate-all.sh [path-to-inweb-executable]"
  exit 2
fi

# Tangle
"$inweb" -read-language literate/Vimscript.ildf literate/vimrc -tangle-to vimfiles/vimrc
"$inweb" -read-language literate/Vimscript.ildf literate/gvimrc.inweb -tangle-to vimfiles/gvimrc
"$inweb" -read-language literate/Vimscript.ildf literate/after/ftplugin/python.inweb -tangle-to vimfiles/after/ftplugin/python.vim

# Weave
# FIXME: These paths are currently specified in the colony file
mkdir -p literate/html/vimrc
mkdir -p literate/html/gvimrc
mkdir -p literate/html/after/ftplugin/python.vim
"$inweb" -read-language literate/Vimscript.ildf -colony literate/colony.txt -member overview -weave
"$inweb" -read-language literate/Vimscript.ildf -colony literate/colony.txt -member vimrc -weave
"$inweb" -read-language literate/Vimscript.ildf -colony literate/colony.txt -member gvimrc -weave
"$inweb" -read-language literate/Vimscript.ildf -colony literate/colony.txt -member python.vim -weave
