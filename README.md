# qtv-hub

### Setup

Place `fteqtv.cert.pem` and `fteqtv.key.pem` in the `nginx` directory.

### Building

Checks out the latest FTE source code and produces an image containing
FTE QTV running as an unprivileged user.

```shell
docker compose build --no-cache
```

### Running

```shell
# Regular start
docker compose up -d

# Recreate with a new build 
docker compose up --force-recreate -d

# Show logs
docker compose logs # -f to follow
```

### Crontab
Due to an uknown error the service has to be restarted occasionally.

```shell
crontab -e
0 9 * * * docker restart compose-fteqtv-1
```
