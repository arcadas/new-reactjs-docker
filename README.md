# New React.js app in Docker

You can create a new React.js project in a fully dockerized development environment with this repositroy.

Requirements: `Docker`

Create new react app:

```sh
./install.sh
```

Run:

```sh
docker-compose up -d
```

Run npm command from the host:

```sh
docker container exec <container name or id> npm <command>
```

If you use nginx proxy, change the docker network name in the docker-compose.yml.
