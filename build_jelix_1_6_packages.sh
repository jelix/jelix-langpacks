#!/usr/bin/env bash

CURRENT_DIR="$(dirname $0)"

TARGET_DIR=_dist/jelix-1.6

mkdir -p $CURRENT_DIR/$TARGET_DIR

LOCALES=$(ls $CURRENT_DIR/jelix-1.6/locales/)

for LOCALE in $LOCALES; do
      (cd $CURRENT_DIR/jelix-1.6/locales/ && zip -r ../../$TARGET_DIR/jelix-1.6-locales-$LOCALE.zip $LOCALE/)
done

(cd $CURRENT_DIR/jelix-1.6/locales/ && zip -r ../../$TARGET_DIR/jelix-1.6-locales-all.zip *)


