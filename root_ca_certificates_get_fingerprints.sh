#!/bin/bash

#
#  Get fingerprints of root certificates from PEM encoded files in a
#  directory.
#
#  Usage: root_ca_certificates_get_fingerprints.sh   FILES_DIRECTORY
#
#  Example: ./root_ca_certificates_get_fingerprints.sh   /etc/ssl/certs/
#

#
#  For each one of the PEM files in the directory $1
#       Print out the filename first, without a newline (-n flag)
#       Print out the fingerprint from the openssl x509 command.
#
extract_fingerprint () {
  if grep -lq "BEGIN CERTIFICATE" $1;
  then
    FINGERPRINT_256=$(openssl x509 -in $1 -fingerprint -sha256 -noout | sed 's/.*=//')
    FINGERPRINT_001=$(openssl x509 -in $1 -fingerprint -sha1   -noout | sed 's/.*=//')
    echo "${FINGERPRINT_256} $1"
    echo "${FINGERPRINT_001} $1"
  fi
}


export -f extract_fingerprint

find $1 -name *.pem -exec bash -c 'extract_fingerprint "$0"' {}  \;

