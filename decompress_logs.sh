#!/bin/bash

#
#  Decompress all log files in the directory tree
#
#  Usage: decompress_logs.sh  zeek/logs
#

echo "Decompressing log files ..."

find $1 -name '*.log.gz' -exec gunzip --force {} \;

