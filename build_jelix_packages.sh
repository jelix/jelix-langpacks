#!/usr/bin/env bash

CURRENT_DIR="$(dirname $0)"

VERSION="$1"

if [ "$VERSION" == "" ]; then
    echo "Error: version is missing"
    exit 1
fi

if [ ! -d "$CURRENT_DIR/jelix-$VERSION" ]; then
    echo "Error: bad version"
    exit 2
fi

TARGET_DIR=_dist/jelix-$VERSION

mkdir -p $CURRENT_DIR/$TARGET_DIR

LOCALES=$(ls $CURRENT_DIR/jelix-$VERSION/locales/)

for LOCALE in $LOCALES; do
      (cd $CURRENT_DIR/jelix-$VERSION/locales/ && zip -r ../../$TARGET_DIR/jelix-$VERSION-locales-$LOCALE.zip $LOCALE/)
done

(cd $CURRENT_DIR/jelix-$VERSION/locales/ && zip -r ../../$TARGET_DIR/jelix-$VERSION-locales-all.zip *)


