#!/usr/bin/env bash

# delete existing examples
rm -rf examples

# save examples
dmntk exs

# send examples content to standard output
cat ./examples/e1/e1.ctx
echo ""
echo "------------------------------------------------------------------------------------------------------------------"
echo ""
cat ./examples/e1/e1.feel
echo ""
echo "=================================================================================================================="
echo ""
cat ./examples/e2/e2.ctx
echo ""
echo "------------------------------------------------------------------------------------------------------------------"
echo ""
cat ./examples/e2/e2.dmn
echo ""
echo "=================================================================================================================="
echo ""
cat ./examples/e3/e3.ctx
echo ""
echo "------------------------------------------------------------------------------------------------------------------"
echo ""
cat ./examples/e3/e3.dtb
echo ""

# delete examples
rm -rf examples
