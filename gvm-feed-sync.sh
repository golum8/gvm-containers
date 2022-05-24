#!/bin/bash

docker run -d --rm --name tmp_container -v gvm-containers_gvm-var-lib:/opt alpine tail -f /dev/null
docker exec tmp_container sh -c 'rm -rf /opt/cert-data/* /opt/data-objects/gvmd/* /opt/gvmd/report_formats/*  /opt/scap-data/*'
docker cp /opt/gvm-data/gvm/cert-data  tmp_container:/opt/
docker cp /opt/gvm-data/gvm/data-objects  tmp_container:/opt/
docker cp /opt/gvm-data/gvm/gvmd  tmp_container:/opt/
docker cp /opt/gvm-data/gvm/scap-data  tmp_container:/opt/
docker exec -it tmp_container /bin/chown -R 102:103 /opt/

docker stop tmp_container
