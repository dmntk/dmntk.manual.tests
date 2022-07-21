#!/usr/bin/env bash

# test decision table
dmntk tdt -s -c never non-existing-name.test input.dtb 2>&1
