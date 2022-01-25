#!/usr/bin/env bash

# remove existing output file
rm -rf output.html

# export DMN model
dmntk xdm 2_0001.dmn output.html

# send the generated HTML content to standard output
cat output.html

# remove output file
rm -rf output.html
