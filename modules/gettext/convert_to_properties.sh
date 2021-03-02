#!/usr/bin/env bash
set -e


if [ "$1" == "" ]; then
    echo "Error: path to the .jelixlocales.ini file is missing"
    exit 1
fi

if [ "$2" == "" ]; then
    echo "Error: module name is missing"
    exit 1
fi

JELIX_LOCALES_INI="$1"
MODULE="$2"

if [ ! -f "$JELIX_LOCALES_INI" ]; then
    echo "Error: given path seems to be not a .jelixlocales.ini file"
    exit 2
fi


LOCALES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

source $LOCALES_DIR/module_list.sh

for LIZLOCALE in $OFFICAL_LOCALES
do
    if [ -f "$LOCALES_DIR/$LIZLOCALE/$MODULE.po" ]; then
        $LOCALES_DIR/../../vendor/bin/jelixlocales convert:po:properties \
         --config=$JELIX_LOCALES_INI \
         --properties-path=$LOCALES_DIR/../locales/:locale/:module/locales/ \
        $MODULE $LIZLOCALE $LOCALES_DIR/$LIZLOCALE/
    fi
done

