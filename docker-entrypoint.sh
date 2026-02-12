#!/bin/bash

uv run airflow db migrate

uv run airflow dag-processor &
uv run airflow triggerer &
uv run airflow scheduler &
uv run airflow api-server --port 8080
