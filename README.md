# Minimum Docker image for Jupyter Notebook with MSSQL support
[![Build Status](https://travis-ci.org/killua8q8/Docker-Jupyter-Notebook.svg?branch=master)](https://travis-ci.org/killua8q8/Docker-Jupyter-Notebook)
> Docker image that built for Jupyter Notebook with minimal requirement.

## Pre-Installation
> Create data sources file for odbc under project root
```sh
$ echo "[MY_DSN]
Driver = ODBC Driver 17 for SQL Server
Server = my.mssql.server  ; replace with your server host
Database = database       ; replace with your database" > dsn.ini
```

## Installation
```sh
$ sudo docker-compose build
```

## Usage
```sh
$ sudo docker-compose up -d
```
