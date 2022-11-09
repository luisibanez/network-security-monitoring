#!/bin/bash

#
#  Compute entropy on  all extracted files
#
#  Usage: entropy_extracted_fies.sh   EXTRACTED_FILES_DIRECTORY
#

echo "Computing Entropy of extracted files ..." 

#
#  For each one of the files in the directory $1
#       Print out the filename first, without a newline (-n flag)
#       Print out the output of the ent (entropy) command in tabular form (-t flag).
#  Remove the headers that ent introduces when using the -t flag 
#  Sort by value of entropy (-k 4 field), from comma separated lines (-t',')
#  Write out the output in 'entropy.csv' file
#
find $1 -name 'extract*'      \
   -exec echo -n {} \;        \
   -exec ent -t  {} \;        \
   |  awk '/Correlation$/ { gsub(/0\,File\-bytes.*Serial\-Correlation/,","); printf("%s", $0); next } 1'   \
   |  sort -t',' -k 4    \
   |  cut -d',' -f1,3,4 \
   |  tr ',' '\t'       \
   |  tee  entropy.csv

