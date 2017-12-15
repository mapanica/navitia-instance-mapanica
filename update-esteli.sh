#!/bin/bash
# Put this script into the data folder of https://github.com/mapanica/navitia-instance-mapanica
set -e
echo "Downloading GTFS of Estelí..."
curl -O https://datos.mapanica.net/ni-esteli-gtfs.zip
echo "Checking if GTFS has changed..."
if ! cmp --silent ni-esteli-gtfs.zip ni-esteli-gtfs.zip.old; then
	echo "Deploying to navitia..."
	docker cp ni-esteli-gtfs.zip navitiadockercomposemaster_tyr_worker_1:/srv/ed/input/ni-esteli/
else
	echo "GTFS has not changed."
fi
echo "Renaming GTFS..."
mv ni-esteli-gtfs.zip ni-esteli-gtfs.zip.old
