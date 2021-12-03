#!/bin/bash

#
#  Concatenate log files into a single file
#

find . -name  ${$1}*  \
 -exec cat {} >> master_{$1}.log \;

