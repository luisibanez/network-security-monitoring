#!/bin/bash
#
#  Summarize SSL messages
#
#  Usage: ssl_summary.sh
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

echo "Summarizing SSL records ..."

cat master_ssl.log \
  | ${ZEEK_CUT} -d server_name \
  | sort | uniq -c | sort -g -r \
  > master_ssl_summary.txt

