#!/bin/bash

#
#  Concatenate log files into a single file
#
#  Usage:  concatenate_logs  zeek/logs_dir  dns
#

find $1 -name  $2*  \
 -exec cat {} >> master_$2.log \;

