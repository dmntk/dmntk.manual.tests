#!/usr/bin/env bash

# run dmntk as a server
dmntk srv > /dev/null 2>&1 & 
_pid=$!

# retrieve system information
curl -s 0.0.0.0:22022/system/info

# stop dmntk server
kill "$_pid"