#!/bin/bash

# make cowsay read books to you, one terminal login at a time.
# setences appear in random order
# NB: all periods are currently considered to end a sentence, so Mr., Dr., St., Ave., etc. are causing a problem
# cows can only read one book at a time - removes previous cowsay lines from ~/.bashrc

# args 1) source txt for cow to read.  check out project gutenberg!
# prereq: cowsay, fortune-mod
# has to be run with root permissions.  crazy
# example use: sudo $0 foo.txt

	# remove lines that appear to have been made by this script from ~/.bashrc
	sed -i '/fortune \/usr\/share\/games\/fortunes\/.* | cowsay/d' ~/.bashrc
	# take the txt file and split up into lines separated by '%' for every period, exclamation, or question mark, then make a .dat file for fortune from this
	# this is a hellish bit of sed
	sed -e ':a;N;$!ba;s:\n: :g;s:\([^.]*\)[.][ \t\r$]\+:\1.\n%\n:g;s:\([^?]*\)\?:\1\?\n%\n:g;s:\([^!]*\)\!:\1\!\n%\n:g' $1 |\
	grep -E "[a-zA-Z%]+" |\
 	sed 's:^[^A-Z]*\([A-Z]\):\1:g' > /usr/share/games/fortunes/$(basename $1 .txt)
	strfile /usr/share/games/fortunes/$(basename $1 .txt)
	echo "fortune /usr/share/games/fortunes/$(basename $1 .txt) | cowsay" >> ~/.bashrc
