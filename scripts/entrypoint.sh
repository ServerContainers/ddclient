#!/bin/sh

# only on container creation
INITIALIZED="/.initialized"
if [ ! -f "$INITIALIZED" ]; then
	touch "$INITIALIZED"

  ###
  # RUNIT
  ###

  echo ">> RUNIT - create services"
  mkdir -p /etc/sv/rsyslog /etc/sv/ddclient
  echo '#!/bin/sh\nexec /usr/sbin/rsyslogd -n' > /etc/sv/rsyslog/run
    echo '#!/bin/sh\nrm /var/run/rsyslogd.pid' > /etc/sv/rsyslog/finish
  echo '#!/bin/sh\nexec /usr/sbin/ddclient -foreground' > /etc/sv/ddclient/run
  chmod a+x /etc/sv/*/run /etc/sv/*/finish

  echo ">> RUNIT - enable services"
  ln -s /etc/sv/ddclient /etc/service/ddclient
  ln -s /etc/sv/rsyslog /etc/service/rsyslog
fi

echo ">> fix rights"
chmod 600 /etc/ddclient.conf > /dev/null 2> /dev/null

echo ">> starting services"
exec runsvdir -P /etc/service
