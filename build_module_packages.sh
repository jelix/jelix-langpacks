#!/usr/bin/env bash

MODULE="$1"

if [ "$MODULE" == "" ]; then
    echo "Error: module name is missing"
    exit 1
fi

CURRENT_DIR="$(dirname $0)"

TARGET_DIR=_dist/$MODULE

mkdir -p $CURRENT_DIR/$TARGET_DIR

LOCALES=$(ls $CURRENT_DIR/modules/locales/)

for LOCALE in $LOCALES; do
  if [ -d $CURRENT_DIR/modules/locales/$LOCALE/$MODULE ]; then
      (cd $CURRENT_DIR/modules/locales/ &&
      zip -r ../../$TARGET_DIR/$MODULE-locales-$LOCALE.zip $LOCALE/$MODULE &&
      zip -r ../../$TARGET_DIR/$MODULE-locales-all.zip $LOCALE/$MODULE
      )
  fi
done



