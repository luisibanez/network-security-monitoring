#!/bin/bash
#
#  Summarize DNS lookups by unique queries
#
#  Usage: http_summary.sh  master_http.log
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

cat $1 \
  | ${ZEEK_CUT} -d host uri \
  | sort | uniq -c | sort -g -r

