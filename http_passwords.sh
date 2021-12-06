#!/bin/bash
#
#  Scan for clear passwords in HTTP calls.
#
#  Usage: http_passwords.sh  master_http.log
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

cat $1 \
  | ${ZEEK_CUT} -d password \
  | grep -v '-'

