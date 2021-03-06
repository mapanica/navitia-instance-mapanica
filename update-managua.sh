#!/bin/bash
# Put this script into the data folder of https://github.com/mapanica/navitia-instance-mapanica
set -e
cd /srv/navitia-docker-compose-master/data/
echo "Downloading GTFS of Managua..."
curl -O https://datos.mapanica.net/ni-managua-gtfs.zip -z ni-managua-gtfs.zip.old
if [ ! -f ni-managua-gtfs.zip ]; then
	cp ni-managua-gtfs.zip.old ni-managua-gtfs.zip
fi
echo "Checking if GTFS has changed..."
if ! cmp --silent ni-managua-gtfs.zip ni-managua-gtfs.zip.old; then
	echo "Deploying to navitia..."
	docker cp ni-managua-gtfs.zip navitiadockercomposemaster_tyr_worker_1:/srv/ed/input/ni-managua/
else
	echo "GTFS has not changed."
fi
echo "Renaming GTFS..."
mv ni-managua-gtfs.zip ni-managua-gtfs.zip.old
