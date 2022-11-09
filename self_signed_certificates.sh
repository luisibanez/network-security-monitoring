#!/bin/bash

#
#  Inspect certificate issuer
#
#  Usage: self_signed_certificates.sh   EXTRACTED_FILES_DIRECTORY
#

#
#  For each one of the files in the directory $1
#       Print out the filename first, without a newline (-n flag)
#       Print out the issuer from the openssl x509 command.
#
extract_issuer () {
  if [[  $(file $1) =~ "Certificate" ]]; then
    SUBJECT=$(openssl x509 -in  $1 -subject -noout | sed 's/subject=//');
    ISSUER=$( openssl x509 -in  $1 -issuer  -noout | sed 's/issuer=//');
    if [[ "${SUBJECT}" == "${ISSUER}" ]]; then
      echo -n "$1: ";
      echo "Probably self signed";
      echo $SUBJECT;
      echo $ISSUER;
    fi
  fi
}


export -f extract_issuer

find $1 -name 'extract*-SSL-*' -exec bash -c 'extract_issuer "$0"' {}  \;

