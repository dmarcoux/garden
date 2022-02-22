# Garden

## Development

1. Clone Git repository
2. With [docker-compose](https://github.com/docker/compose), spin up development environment: `docker-compose up`.
3. Access the Docker container `web_app` with `docker exec -it CONTAINER_ID bash` and:
- setup the application with `bin/setup`.
- run the Rails application with `bin/run`, then access it on `http://localhost:3000`.
