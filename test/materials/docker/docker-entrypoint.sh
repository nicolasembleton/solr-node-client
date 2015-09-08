#!/bin/bash

# chown -R $SOLR_USER:$SOLR_USER /data

su -c "$@" -m $SOLR_USER
