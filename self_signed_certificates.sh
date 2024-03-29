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
extract_authority () {
  if [[  $(file $1) =~ "Certificate" ]]; then
    SUBJECT=$(openssl x509 -in  $1 -subject -noout | sed 's/subject=//');
    ISSUER=$( openssl x509 -in  $1 -issuer  -noout | sed 's/issuer=//');
    if [[ "${SUBJECT}" == "${ISSUER}" ]]; then
      AUTHORITY_KEY_IDENTIFIER=$(openssl x509 -in $1 -noout -text | grep -A1 'Authority Key Identifier' | tail -n 1);
      SUBJECT_KEY_IDENTIFIER=$(  openssl x509 -in $1 -noout -text | grep -A1 'Subject Key Identifier'   | tail -n 1);
      if [[ "${AUTHORITY_KEY_IDENTIFIER}" == "${SUBJECT_KEY_IDENTIFIER}" ]]; then
        echo "${AUTHORITY_KEY_IDENTIFIER} $1";
        if grep -lq ${AUTHORITY_KEY_IDENTIFIER} /tmp/certificates_fingerprints.txt;
        then
          echo "FOUND ROOT CA: $(grep -lq ${AUTHORITY_KEY_IDENTIFIER} /tmp/certificates_fingerprints.txt)"
        fi
      fi
    fi
  fi
}


export -f extract_authority

find $1 -name 'extract*-SSL-*' -exec bash -c 'extract_authority "$0"' {}  \;

