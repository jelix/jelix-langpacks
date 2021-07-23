#!/usr/bin/env bash
set -e

JELIX_LOCALES_INI=""
PROPERTIES_PATH=""
MODULES_LIST=""
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
      if [ "$MODULES_LIST" = "" ]; then
        MODULES_LIST="$i"
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

if [ ! -f "$JELIX_LOCALES_INI" ]; then
    echo "Error: given path seems to be not a .jelixlocales.ini file"
    exit 2
fi

LOCALES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

source $LOCALES_DIR/module_list.sh

if [ "$PROPERTIES_PATH" == "" ]; then
  PROPERTIES_PATH="$LOCALES_DIR/../locales/:locale/:module/locales/"
fi

if [ "$MODULES_LIST" != "" ]; then
  MODULES="$MODULES_LIST"
fi

for MODULE in $MODULES
do
    for LIZLOCALE in $OFFICIAL_LOCALES
    do
        LIZLOCALEFULL=$LIZLOCALE

        if [[ "$LIZLOCALE" == */* ]]; then
           LIZLOCALEFULL=$(echo $LIZLOCALE | cut -d '/' -f2)
           LIZLOCALE=$(echo $LIZLOCALE | cut -d '/' -f1)
        fi

        if [ -f "$LOCALES_DIR/$LIZLOCALE/$MODULE.po" ]; then
            $LOCALES_DIR/../../vendor/bin/jelixlocales convert:po:properties \
             --config=$JELIX_LOCALES_INI \
             --properties-path=$PROPERTIES_PATH \
            $MODULE $LIZLOCALEFULL $LOCALES_DIR/$LIZLOCALE/
        fi
    done
done
