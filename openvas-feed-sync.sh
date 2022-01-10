#!/bin/bash

docker run -d --rm --name tmp_container -v gvm-containers_openvas-var-lib:/opt alpine tail -f /dev/null

docker cp /opt/gvm-data/openvas/plugins tmp_container:/opt/
docker exec -it tmp_container /bin/chown -R 102:102 /opt/

docker stop tmp_container
