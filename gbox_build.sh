#!/bin/bash

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
