docker run -e HOST_WD=`pwd` --rm --network host -v `pwd`:/tmp/build -v /var/run/docker.sock:/var/run/docker.sock -it granatumx/gbox-build:1.0.0 bash
