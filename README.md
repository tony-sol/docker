# Environment for development php web applications #

- [Environment for development php web applications](#environment-for-development-php-web-applications)
  - [Stack includes:](#stack-includes)
  - [Requirements:](#requirements)
  - [Usage:](#usage)
  - [Development plans:](#development-plans)

## Stack includes:

| Service                                                              | [Profile](https://docs.docker.com/compose/profiles/) | Description                                            |
|----------------------------------------------------------------------|------------------------------------------------------|--------------------------------------------------------|
| [Php](./images/php/Dockerfile)                                       | *none*                                               | Main App container with PHP 8.1                        |
| [Angie](./images/Angie/Dockerfile)                                   | Angie                                                | Web server for php-fpm                                 |
| [Postgres](https://hub.docker.com/_/postgres/)                       | postgres                                             | Relational database and management system              |
| [Redis](https://hub.docker.com/_/redis/)                             | redis                                                | In-memory key–value database                           |
| [Tarantool](https://hub.docker.com/r/tarantool/tarantool/)           | tarantool                                            | Lua app server integrated with a DB management system  |
| [Clickhouse](https://hub.docker.com/r/clickhouse/clickhouse-server/) | clickhouse                                           | Columnar database and management system                |
| [Kafka](https://hub.docker.com/r/bitnami/kafka/)                     | kafka                                                | Distributed event store and stream-processing platform |
| [Kowl](https://hub.docker.com/r/rsmnarts/kowl/)                      | kafka                                                | Easy-to-use web UI for kafka management                |
| [Vault](https://hub.docker.com/_/vault/)                             | vault                                                | Tool for securely accessing secrets                    |
| [Consul](https://hub.docker.com/_/consul/)                           | consul                                               | Service networking platform                            |
| [Prometheus](https://hub.docker.com/r/prom/prometheus/)              | prometheus                                           | Monitoring system with a time series database          |
| [Grafana](https://hub.docker.com/r/grafana/grafana/)                 | prometheus/loki                                      | Interactive visualization for Prometheus               |
| [Promtail](https://hub.docker.com/r/grafana/promtail/)               | loki                                                 | Log exporter for Loki                                  |
| [Loki](https://hub.docker.com/r/grafana/loki/)                       | loki                                                 | Log Aggregation by Grafana                             |

## Requirements:
* Docker Loki logs driver
  ```shell
  docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
  ```

## Usage:
```shell
./docker/bin/start          # start all containers
./docker/bin/stop           # stop all containers
./docker/bin/restart        # stop+start wrapper
./docker/bin/attach ${name} # attach to ${name} service's container
./docker/bin/status         # show status of running containers
./docker/bin/remove         # remove all containers, including all data
./docker/bin/logs ${name}   # show ${name} service's container syslog
```

## Development plans:
* Add [Sentry](https://hub.docker.com/_/sentry) - Error tracker and performance monitoring tool
* Add (or not) Prometheus exporters:
  * [Node-Exporter](https://hub.docker.com/r/prom/node-exporter)
  * [Consul-Exporter](https://hub.docker.com/r/prom/consul-exporter)
  * [Postgres-Exporter](https://hub.docker.com/r/prometheuscommunity/postgres-exporter)
  * [Kafka-Exporter](https://hub.docker.com/r/danielqsj/kafka-exporter)
* Add (or not) RoadRunner application server
