#!/usr/bin/env bash
MODULE_NAME="XC5_GSI_fixes"
EXCLUDE="ril-libs/a54/* ril-libs/binary6/* ril-libs/binary7/* LICENSE README.md pack_module.sh"

rm -f $MODULE_NAME
zip -9 --recurse-paths "${MODULE_NAME}.zip" --exclude $EXCLUDE -- * >/dev/null
