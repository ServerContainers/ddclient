# Docker DDClient (servercontainers/ddclient)
_maintained by ServerContainers_

[FAQ - All you need to know about the servercontainers Containers](https://marvin.im/docker-faq-all-you-need-to-know-about-the-marvambass-containers/)

## What is it

This Dockerfile (available as ___servercontainers/ddclient___) gives you a ddclient server.

It's based on the [_/debian:stretch](https://registry.hub.docker.com/_/debian/) Image

View in Docker Registry [servercontainers/ddclient](https://registry.hub.docker.com/u/servercontainers/ddclient/)

View in GitHub [ServerContainers/ddclient](https://github.com/ServerContainers/ddclient)

## Environment variables

_currently no available_

## Volumes

- /etc/ddclient.conf
    - ddclient.conf
    - should be readonly
    - owner must be root with access rights set to 600

## Example Configuration

```
daemon=300
pid=/var/run/ddclient.pid
syslog=yes

protocol=dyndns2         

use=web, web=checkip.dyndns.org/, web-skip='IP Address' # found after IP Address

server=<SERVERNAME>
ssl=yes

login=<USERNAME>
password=<PASSWORD>

wildcard=yes

<DOMAINS>
```
