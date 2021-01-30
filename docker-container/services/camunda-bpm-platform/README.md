# Description

A camunda bpmn platform

## Table of contents

1. [Service requirements](#service-requirements)
1. [Installation instructions](#installation-instructions)
1. [Usage](#usage)

### Service requirements

- [Postgresql Database](../db-postgresql/README.md)

### Installation instructions

1. Create needed database
    1. `docker exec -it db-postgresql_db-postresql_1 bash`
    1. `psql -U postgres -c 'CREATE DATABASE "camunda-bpm-platform"'`
1. `docker-compose up -d`

#### Usage

1. Service is located at `localhost/camunda-bpm-platform` (You can replace `localhost` by the IP of the host machine).
