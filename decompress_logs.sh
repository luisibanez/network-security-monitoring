#!/bin/bash

#
#  Decompress all log files in the directory tree
#
#  Usage: decompress_logs.sh  zeek/logs
#

find $1 -name *.log.gz -exec gunzip {} \;

