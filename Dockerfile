FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q -y update \
 && apt-get -q -y --no-install-recommends install ddclient \
                                                  libio-socket-ssl-perl \
                                                  ca-certificates \
                                                  rsyslog \
                                                  runit \
 && apt-get -q -y clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 \
 && sed -i 's/="true/="false/g' /etc/default/ddclient \
 && sed -i 's/run_daemon="false"/run_daemon="true"/g' /etc/default/ddclient \
 \
 && head -n $(grep -n RULES /etc/rsyslog.conf | cut -d':' -f1) /etc/rsyslog.conf > /etc/rsyslog.conf.new \
 && mv /etc/rsyslog.conf.new /etc/rsyslog.conf \
 && echo '*.*        /dev/stdout' >> /etc/rsyslog.conf \
 && sed -i 's/.*imklog.*//g' /etc/rsyslog.conf \
 \
 && rm -rf /etc/ddclient.conf


COPY scripts /usr/local/bin
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
