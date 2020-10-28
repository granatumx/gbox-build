#!/bin/bash

# This file is run inside the gbox-build docker image to run the build process.
# It copies the items first so that no destruction of the build directory occurs.

rsync -av /tmp/build/ /tmp/deploy/

cp Makefile /tmp/deploy
cd /tmp/deploy
echo "Checking VERSION.txt"
cat VERSION.txt
make doc
make docker
echo "You will now need to exit gbox-build and run:"
GBOX=`cat GBOX_BASE_NAME.txt`
VER=`cat VERSION.txt`
echo "docker push $GBOX:$VER"
