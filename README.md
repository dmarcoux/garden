# Garden

## Development

1. Clone Git repository
2. Run `bin/setup_history_files`
3. With [docker-compose](https://github.com/docker/compose), spin up development environment: `docker-compose up`.
4. Access the Docker container `web_app` with `docker exec -it CONTAINER_ID bash`.
5. Do what you need to do. Some examples are listed below...

### Setup the Rails Application

Run `bin/setup`.

### Run the Rails Application

Run `bin/dev`, then access `http://localhost:3000`.

### Run Linters, Tests and Audits

Run `bin/ci`.

### Connect to SQLite Database

Run `sqlite3 db/development.sqlite3`.

### Connect to Web Application, Redis or Another Process Managed by Overmind

Run `bin/overmind connect [process_name]`.
Disconnect from the process window with `Ctrl + b`, then `d`.

### Manage JavaScript Dependencies

Run `bin/importmap` to see the available commands.

## Architecture

Class diagram generated with [Mermaid](https://github.com/mermaid-js/mermaid).

```mermaid
  classDiagram
  Plant "1" --> "0..n" Companion: plant1_id
  Plant "1" --> "0..n" Companion: plant2_id
  Plant "1" --> "0..n" active_storage_attachments: images
  active_storage_attachments "1" --> "1" active_storage_blobs

  class Plant {
    +bigint id
    +string common_name
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

  class active_storage_attachments {
    internal from Rails
  }

  class active_storage_blobs {
    internal from Rails
  }
```

## Design

Avoid creating global CSS rules by relying solely on the utility-first approach
of Tailwind CSS to create view components whenever there is repetition.
