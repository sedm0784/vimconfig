" The standard Vim runtime doesn't include an Objective-C++ indent file. Just
" use the Objective-C one, which correctly aligns colons in multiline message
" invocations. Note that this won't do anything if b:did_indent is already
" set, so it shouldn't break if an Objective-C++ indent file is added later.
source $VIMRUNTIME/indent/objc.vim
