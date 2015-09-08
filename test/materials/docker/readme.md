# Solr-Client library test Docker

## Pre-requisite

You need to have docker installed and setup.
To setup docker, follow the instructions here: https://docs.docker.com/installation/

## Build

From the ./docker/ folder, run:

`$ docker build -t solr-client-test .`

## Run

From the same folder, run:

`$ docker run --name solr-client-test -p 8983:8983 solr-client-test`

## Stop

`$ docker stop solr-client-test`

## Restart

`$ docker start solr-client-test`

## Update the Docker schema

`$ docker stop solr-client-test && docker rm -f solr-client-test`

Then re-build and re-run it.
