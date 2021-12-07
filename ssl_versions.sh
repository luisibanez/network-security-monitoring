#!/bin/bash
#
#  Summarize SSL protocol versions.
#
#  Usage: ssl_summary.sh  master_ssl.log
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

cat $1 \
  | ${ZEEK_CUT} -d version next_protocol \
  | sort | uniq -c | sort -g -r

