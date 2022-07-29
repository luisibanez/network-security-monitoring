#!/bin/bash
#
#  Summarize SSL protocol versions.
#
#  Usage: ssl_summary.sh
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

echo "Summarizing SSL Version records ..."

cat master_ssl.log \
  | ${ZEEK_CUT} -d version next_protocol \
  | sort | uniq -c | sort -g -r \
  >  master_ssl_versions.txt

