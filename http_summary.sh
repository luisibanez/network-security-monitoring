#!/bin/bash
#
#  Summarize DNS lookups by unique queries
#
#  Usage: http_summary.sh
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

cat master_http.log \
  | ${ZEEK_CUT} -d host uri username password \
  | sort | uniq -c | sort -g -r \
  > master_http_summary.txt

