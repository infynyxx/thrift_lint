#!/bin/sh

THRIFT_FILE=$1

if [ ! -f "$THRIFT_FILE" ];
then
    echo "Thrift file is required!"
    exit 1
fi

while true
do
    TMP_DIR="/tmp/thrift_lint_$RANDOM"
    if [ ! -d "$TMP_DIR" ]; then
        mkdir -p $TMP_DIR
        break; # directory doesn't exist so, safe to use it
    fi
done

echo "Generating files in $TMP_DIR"

thrift --gen java -o $TMP_DIR $THRIFT_FILE

retval=$?

if [ $retval -eq 0 ]; then
    echo "No errors found in thrift file: $THRIFT_FILE"
else
    echo "^^^ Error(s) found!"
fi

echo "Removing $TMP_DIR"
rm -r $TMP_DIR
