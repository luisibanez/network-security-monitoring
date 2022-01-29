#!/bin/bash

#
#  Concatenate log files into a single file
#
#  Usage:  concatenate_logs  [LOGS_DIR]
#

for signal in capture conn-summary conn. dns dhcp files http ocsp software ssl stats weird x509
    do
        echo "Concatenating $signal ..."
        find $1 -name  $signal*  \
            -exec cat {} >> master_$signal.log \;
    done
