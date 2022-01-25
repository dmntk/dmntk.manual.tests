#!/usr/bin/env bash

# remove existing output file
rm -rf output.html

# exports feel expression to HTML
dmntk xfe input.ctx input.feel output.html

# send the generated HTML content to standard output
cat output.html

# remove output file
rm -rf output.html

