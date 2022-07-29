#!/bin/bash
#
#  Summarize FILES logs including their Entropy.
#
#  Usage: files_summary.sh
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

echo "Summarizing Files records ..."

cat master_files.log \
  | ${ZEEK_CUT} -d entropy mime_type filename extracted extrated_size \
  | sort -g | uniq \
  > master_files_summary.txt

