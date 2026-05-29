#!/bin/bash
# This combines the time with whatever custom logic you want
TIME=$(date +'%H:%M')
CUSTOM=$(bash ~/status.sh) 

echo "󰅐 $TIME | $CUSTOM"
