#!/bin/bash

# This file is run inside the gbox-build docker image to run the staging process.
# It copies the items first so that no destruction of the build directory occurs
# It creates a version with "-staging" appended so that it does not clobber the working version.
# After running in the pipeline, you can use "gxtest {step-id-uuid-string}" in the parent directory
# Then run gtest to find out where the problem is during debugging.

rsync -av /tmp/build/ /tmp/staging/

cp Makefile /tmp/staging
cd /tmp/staging
echo "Checking VERSION.txt"
VER=`cat VERSION.txt`
echo "$VER-staging" > VERSION.txt
cat VERSION.txt
make docker
echo "You will now need to exit gbox-staging and run:"
GBOX=`cat GBOX_BASE_NAME.txt`
VER=`cat VERSION.txt`
echo "gx installGbox.sh $GBOX:$VER"
