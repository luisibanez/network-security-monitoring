#!/bin/bash
#
#  Summarize FILES logs including their Entropy.
#
#  Usage: files_summary.sh  master_files.log
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

cat $1 \
  | ${ZEEK_CUT} -d entropy mime_type filename \
  | sort -g

