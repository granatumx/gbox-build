#!/bin/bash

rsync -av /tmp/build/ /tmp/deploy/

cp Makefile /tmp/deploy
cd /tmp/deploy
echo "Checking VERSION.txt"
cat VERSION.txt
echo "Checking GBOX_BASE_NAME.txt"
cat GBOX_BASE_NAME.txt
GBOX=`cat GBOX_BASE_NAME.txt`
VER=`cat VERSION.txt`
echo -e "Checking image"
if [[ "$(docker images -q $GBOX:$VER 2> /dev/null)" == "" ]]; then
	echo -e "\033[0;31mNo image found locally.\033[0m"
	echo -e "Please run gbox_build.sh first"
	exit
fi
echo -e "\033[32mRunning tests, stand back.\033[0m"
if [[ -d "runtest/" ]]; then
	make --always-make test
else
	echo -e "\003[0;31mNo tests found.\033[0m"
fi
echo "You exit the build environment and run:"
echo "docker push $GBOX:$VER"
