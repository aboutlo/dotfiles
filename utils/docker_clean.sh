#!/bin/bash
ACTIVE_CONTAINERS=`docker container ls -q`
if [ -z "$ACTIVE_CONTAINERS" ]
then
	echo "No containers to stop"
else
	echo "Stopping Containers"
	docker container stop $ACTIVE_CONTAINERS > /dev/null
fi
echo "Wiping stopped containers, unused networks and unused volumes"
docker container prune -f > /dev/null
docker network prune -f > /dev/null
docker volume prune -f > /dev/null
echo "All clear"
