#!/bin/bash
#
#  Summarize x509 messages
#
#  Usage: x509_summary.sh
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

echo "Summarizing x509 records ..."

cat master_x509.log \
  | grep -v "^#" | cut -d$'\t' -f5,6 \
  | sort | uniq -c | sort -g -r \
  | awk -F, '$2==$3'  \
  > master_x509_self_signed.txt

