#!/bin/bash
#
#  Summarize x509 messages
#
#  Usage: x509_summary.sh
#

ZEEK_CUT=/usr/local/zeek/bin/zeek-cut

cat master_x509.log \
  | ${ZEEK_CUT} -d certificate.issuer san.dns san.email certificate.subject \
  | sort | uniq -c | sort -g -r \
  > master_x509_summary.txt

