#!/usr/bin/env bash

# remove existing output file
rm -rf output.html

# export decision table to HTML
dmntk xdt input.dtb output.html

# send the generated HTML content to standard output
cat output.html

# remove output file
rm -rf output.html
