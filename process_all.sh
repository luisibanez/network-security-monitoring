#!/bin/bash

#
#  Perform full processing of raw log files.
#
#  Usage:  process_all.sh  [LOGS_DIR]
#


#
#  https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
#
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo $SCRIPT_DIR

$SCRIPT_DIR/decompress_logs.sh  $1
$SCRIPT_DIR/concatenate_logs.sh  $1
$SCRIPT_DIR/dns_queries_summary.sh
$SCRIPT_DIR/files_summary.sh
$SCRIPT_DIR/http_passwords.sh
$SCRIPT_DIR/http_summary.sh
$SCRIPT_DIR/software_summary.sh
$SCRIPT_DIR/ssl_summary.sh
$SCRIPT_DIR/ssl_versions.sh
$SCRIPT_DIR/x509_summary.sh
