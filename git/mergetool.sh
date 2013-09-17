#!/bin/bash
tool=`which emacs`
[ $# -eq 7 ] && $tool -nw -diff "$2" "$5"
[ $# -eq 2 ] && $tool -nw -diff "$1" "$2"
