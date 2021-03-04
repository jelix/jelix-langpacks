#!/usr/bin/env bash
set -e


JELIX_LOCALES_INI=""
PROPERTIES_PATH=""
MODULE=""
for i in $*
do
case $i in
    --target=*)
      PROPERTIES_PATH=$(echo $i| cut -c 10- )
    ;;
    -*)
      echo "ERROR: Unknown option: $i"
      echo ""
      usage
      exit 1
    ;;
    *)
    if [ "$JELIX_LOCALES_INI" = "" ]; then
        JELIX_LOCALES_INI="$i"
    else
      if [ "$MODULE" = "" ]; then
        MODULE="$i"
      else
        echo "ERROR: Two many arguments"
        usage
        exit 3
      fi
    fi
    ;;
esac
done


if [ "$JELIX_LOCALES_INI" == "" ]; then
    echo "Error: path to the .jelixlocales.ini file is missing"
    exit 1
fi

if [ "$MODULE" == "" ]; then
    echo "Error: module name is missing"
    exit 1
fi

if [ ! -f "$JELIX_LOCALES_INI" ]; then
    echo "Error: given path seems to be not a .jelixlocales.ini file"
    exit 2
fi


LOCALES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

source $LOCALES_DIR/module_list.sh

for LIZLOCALE in $OFFICIAL_LOCALES
do
    if [ -f "$LOCALES_DIR/$LIZLOCALE/$MODULE.po" ]; then
        $LOCALES_DIR/../../vendor/bin/jelixlocales convert:po:properties \
         --config=$JELIX_LOCALES_INI \
         --properties-path=$PROPERTIES_PATH \
        $MODULE $LIZLOCALE $LOCALES_DIR/$LIZLOCALE/
    fi
done

