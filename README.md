# Tor + Privoxy Container

Smallest docker image with [Tor](https://www.torproject.org/) and [Privoxy](https://www.privoxy.org/) on Alpine Linux.

Versions are those available in the Alpine Linux package repositories at the time of build.

```sh
docker run -d -p 8118:8118 -p 9050:9050 ghcr.io/6cubi57z/tor-privoxy
curl -s --no-buffer --proxy http://localhost:8118 https://check.torproject.org
```

Original blog post by rdsubhas: <https://medium.com/@rdsubhas/docker-image-with-tor-privoxy-and-a-process-manager-under-15-mb-c9e344111b61>.

Additions in this fork:

- Alpine version updated
- Healthcheck added to container
- Automated build to Github Container Registry

## Known Issues

- When running in interactive mode, pressing Ctrl+C doesn't cleanly exit. For now, run it in detached mode (`-d`). Calling `docker stop` cleanly exits though.
