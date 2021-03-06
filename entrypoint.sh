#!/bin/bash

set -e

echo "CONFIG: $PELICAN_CONFIG_FILE"
echo "CONTENT: $PELICAN_CONTENT_FOLDER"
echo "OUTPUT: $PELICAN_OUTPUT_FOLDER"

echo 'Installing Python π Requirements  '
pip install -r requirements.txt


echo 'Building site π· '
pelican -D ${PELICAN_CONTENT_FOLDER:=content} -o ${PELICAN_OUTPUT_FOLDER:=output} -s ${PELICAN_CONFIG_FILE:=publishconf.py}

if [ -f addons.py ]; then
  echo 'Running add-ons ββ '
  python addons.py
else
  echo 'No add-ons configured'
fi

echo 'Build complete ππ πΊπ '
