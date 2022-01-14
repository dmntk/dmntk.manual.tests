#!/usr/bin/env bash

# display actual dmntk version
echo " "
echo "────────────────────────────────────"
echo " Tested version: $(dmntk -V)"
echo "────────────────────────────────────"

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
    echo -e "\e[32mEXPECTED\e[0m                                                                                                \e[31mACTUAL\e[0m"
    echo -e "\e[32m─────────────────────────────────────────────────────────────────────────────────────────────────\e[0m       \e[31m─────────────────────────────────────────────────────────────────────────────────────────────────\e[0m"
    diff expected actual -y --color=always -W 200
    echo ""
    echo ""
    echo "Full report:"
    diff actual expected --color=always
    rm actual
  fi
  cd $WORK_DIR
}

for dir in $(find ./tests -type d | sort); do
  if [ -f "$dir/$RUN_FILE" ]; then
    run_test "$dir" "$RUN_FILE"
  fi
done

echo "────────────────────────────────────"
echo " $PASSED passed, $FAILED failed"
echo "────────────────────────────────────"
echo " "

exit 0
