#!/usr/bin/env bash

RUN_FILE=run.sh
WORK_DIR=$(pwd)

PASSED=0
FAILED=0

run_test () {
  cd $1
  if [ -f "actual" ]; then
    rm actual
  fi
  ./$2 > actual
  diff expected actual -y >> /dev/null 2>&1
  if [ $? -eq 0 ]; then
    PASSED=$((PASSED+1))
    rm actual
    echo "$1/$2....OK"
  else
    FAILED=$((FAILED+1))
    echo "$1/$2....FAILED"
    echo ""
    echo "EXPECTED                                                                                  ACTUAL"
    echo "---------------------------------------------------------------------------------------   ---------------------------------------------------------------------------------------"
    diff expected actual -y --color=always -W 180
    echo ""
    echo ""
    echo "Full report:"
    diff expected actual --color=always
    rm actual
  fi
  cd $WORK_DIR
}

for dir in $(find ./tests -type d); do
  if [ -f "$dir/$RUN_FILE" ]; then
    run_test "$dir" "$RUN_FILE"
  fi
done

echo "$PASSED passed, $FAILED failed"

exit 0
