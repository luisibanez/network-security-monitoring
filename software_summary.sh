#!/bin/bash
#
#  Summarize Software from the user-agent string.
#
#  Usage: software_summary.sh  master_software.log
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

echo "Summarizing Software records ..."

cat master_software.log \
  | ${ZEEK_CUT} -d unparsed_version \
  | sort | uniq -c | sort -g -r \
  > master_software_summary.txt

