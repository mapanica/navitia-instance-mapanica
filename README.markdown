# Navitia Instance MapaNica

https://navitia.mapanica.net/v1

## Spin up the server

`docker-compose -f docker-compose.yml -f mapanica-instances.yml up -d`

## Stop the server

`docker-compose -f docker-compose.yml -f mapanica-instances.yml down`

## Add region to server

In `mapanica-instances-list.yml` all regions served by MapaNica.net are listed.
If you want to add a region, just edit the file and execute the following commands:
```
pip install "j2cli[yaml]"
j2 docker-instances.jinja2 mapanica-instances-list.yml > mapanica-instances.yml
```

## Source

Based on
[CanalTP/navitia-docker-compose](https://github.com/CanalTP/navitia-docker-compose).
