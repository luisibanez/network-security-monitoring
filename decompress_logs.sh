#!/bin/bash

#
#  Decompress all log files in the directory tree
#

find . -name *.log.gz -exec gunzip {} \;

