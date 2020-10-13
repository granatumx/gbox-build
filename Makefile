VERfile="VERSION.txt"
GBOXfile="GBOX_BASE_NAME.txt"
VER=`cat $(VERfile)`
GBOX=`cat $(GBOXfile)`:$(VER)
export

docker:
	docker build --build-arg VER=$(VER) --build-arg GBOX=$(GBOX) -t $(GBOX) .

docker-push:
	docker push $(GBOX)

shell:
	docker run --rm -it $(GBOX) /bin/bash

# Kicks off a docker generation in its own gbox on the host using 
# the passed in host working directory HOST_WD
doc:
	docker run --rm -v $(HOST_WD):/tmp/try -v /var/run/docker.sock:/var/run/docker.sock -it granatumx/doc:$(VER) doconce format pandoc /tmp/try/README.do.txt --github_md;

test:
	docker run --rm -e GRANATUM_SWD=/tmp/test -v $(HOST_WD)/test:/tmp/test -v /var/run/docker.sock:/var/run/docker.sock -it $(GBOX) /tmp/test/test.sh 