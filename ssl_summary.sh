#!/bin/bash
#
#  Summarize SSL messages
#
#  Usage: ssl_summary.sh  master_ssl.log
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

cat $1 \
  | ${ZEEK_CUT} -d server_name \
  | sort | uniq -c | sort -g -r

