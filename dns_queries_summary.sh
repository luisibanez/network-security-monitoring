#!/bin/bash
#
#  Summarize DNS lookups by unique queries
#
#  Usage: dns_queries_summary.sh  master_dns.log
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

cat master_dns.log \
  | ${ZEEK_CUT} -d id.resp_h query \
  | sort | uniq -c | sort -g -r \
  | grep "8.8.4.4" \
  | sed 's/8.8.4.4\t//' \
  > master_dns_summary.txt

