#!/usr/bin/env bash

# this command should report and error, because the file containing FEEL expression does not exist
dmntk pfe input.ctx non-existing-name.feel 2>&1