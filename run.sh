#!/usr/bin/env bash

RUN_FILE=run.sh
WORK_DIR=$(pwd)

run_test () {
  cd $1
  if [ -f "actual" ]; then
    rm actual
  fi
  ./$2 > actual
  diff expected actual -y >> /dev/null 2>&1
  if [ $? -eq 0 ]; then
    rm actual
    echo "$1/$2....OK"
  else
    echo "$1/$2....FAILED"
    echo "EXPECTED                                                                                ACTUAL"
    echo "-------------------------------------------------------------------------------------   -------------------------------------------------------------------------------------"
    diff expected actual -y --color=always -W 180
    rm actual
    exit 1
  fi
  cd $WORK_DIR
}

for dir in $(find ./tests -type d); do
  if [ -f "$dir/$RUN_FILE" ]; then
    run_test "$dir" "$RUN_FILE"
  fi
done

echo "All tests passed."

exit 0
