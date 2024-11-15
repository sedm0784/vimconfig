#!/bin/sh

inweb="$1"

if [ -z "$inweb" ]
then
  echo "Usage: literate/generate-all.sh [path-to-inweb-executable]"
  exit 2
fi

# Tangle
"$inweb" -read-language literate/Vimscript.ildf literate/vimrc -tangle-to vimfiles/vimrc

# Weave
"$inweb" -read-language literate/Vimscript.ildf -colony literate/colony.txt -member vimrc -weave
