FROM    java:8
MAINTAINER  Martijn Koster "mak-docker@greenhills.co.uk"

FROM    java:openjdk-8-jre
MAINTAINER  Martijn Koster "mak-docker@greenhills.co.uk"

ENV SOLR_VERSION 5.3.0
ENV SOLR solr-$SOLR_VERSION
ENV SOLR_USER solr
ENV SOLR_ROOT /opt/solr
ENV SOLR_HOME /solr-home
ENV SOLR_DATA /data

# Install Solr
RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get -y install lsof && \
  groupadd -r $SOLR_USER && \
  useradd -r -g $SOLR_USER $SOLR_USER && \
  mkdir -p /opt && \
  wget -nv --output-document=/opt/$SOLR.tgz http://www.us.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz && \
  tar -C /opt --extract --file /opt/$SOLR.tgz && \
  rm /opt/$SOLR.tgz && \
  ln -s /opt/$SOLR /opt/solr && \
  mkdir -p /opt/solr/server/solr/lib && \
  chown -R $SOLR_USER:$SOLR_USER /opt/solr /opt/$SOLR

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY solr-home/ $SOLR_HOME

RUN mkdir $SOLR_DATA

RUN chown -R $SOLR_USER:$SOLR_USER $SOLR_HOME
RUN chown -R $SOLR_USER:$SOLR_USER $SOLR_DATA

EXPOSE 8983
WORKDIR $SOLR_ROOT
# USER $SOLR_USER
ENTRYPOINT ["/docker-entrypoint.sh"]
# CMD ["/opt/solr/bin/solr -f -s $SOLR_HOME"]
CMD ["/bin/bash", "-c", "/opt/solr/bin/solr -f"]