#!/bin/bash

# Kopiowanie plików mixeway.p12 i trust.jks do voluminu dokera. 
# Java nie moe być uruchamiana z uytkownika root dlatego trzba zmienić ownera plików 

docker run -d --rm --name tmp_container -v gvm-containers_mixeway-pki:/opt alpine tail -f /dev/null
docker cp ~/mixeway/pki/. tmp_container:/opt/
docker exec -it tmp_container /bin/chown -R 102:103 /opt/
docker stop tmp_container