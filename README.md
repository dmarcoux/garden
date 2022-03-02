# Garden

## Development

1. Clone Git repository
2. Run `bin/setup_history_files`
3. With [docker-compose](https://github.com/docker/compose), spin up development environment: `docker-compose up`.
4. Access the Docker container `web_app` with `docker exec -it CONTAINER_ID bash`.

### Setup

Inside the Docker container, run `bin/setup`.

### Run the Rails Application

Inside the Docker container, run `bin/dev`, then access `http://localhost:3000`.

### Run Tests and Continuous Integration

Inside the Docker container, run `bin/ci`.

### Connect to SQLite Database

Inside the Docker container, run `sqlite3 db/development.sqlite3`.

## Architecture

Class diagram generated with [Mermaid](https://github.com/mermaid-js/mermaid).

```mermaid
  classDiagram
  Plant "1" --> "0..n" Companion: plant1_id
  Plant "1" --> "0..n" Companion: plant2_id
  Plant "1" --> "1..n" PlantName: plant_id
  Plant "1" --> "0..n" active_storage_attachments: images
  active_storage_attachments "1" --> "1" active_storage_blobs

  class Plant {
    +bigint id
    +string latin_name
    +tinyint germination_temperature_minimum
    +tinyint germination_temperature_maximum
    +tinyint planting_depth
  }

  class Companion {
    +bigint plant1_id
    +bigint plant2_id
    +enum[good,bad] type
    +text reason
  }

  class PlantName {
    +bigint plant_id
    +string name
  }

  class active_storage_attachments {
    internal from Rails
  }

  class active_storage_blobs {
    internal from Rails
  }
```
