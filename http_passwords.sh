#!/bin/bash
#
#  Scan for clear passwords in HTTP calls.
#
#  Usage: http_passwords.sh
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

echo "Summarizing HTTP Password records ..."

cat master_http.log \
  | ${ZEEK_CUT} -d password host \
  | sort | uniq -c | sort -g -r \
  >  master_http_passwords.txt

