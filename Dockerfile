FROM python:3.12
COPY --from=ghcr.io/astral-sh/uv:0.10.2 /uv /uvx /bin/

ARG AIRFLOW_VERSION=3.1.7
ARG PYTHON_CONSTRAINTS=3.12
ARG AIRFLOW_PROVIDER_KEYCLOAK_VERSION=0.5.1

ENV AIRFLOW_HOME=/opt/airflow

WORKDIR ${AIRFLOW_HOME}

RUN uv venv .venv

RUN uv pip install \
    "apache-airflow[postgres]==${AIRFLOW_VERSION}" \
    "apache-airflow-providers-keycloak[common.compat]==${AIRFLOW_PROVIDER_KEYCLOAK_VERSION}" \
    --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_CONSTRAINTS}.txt"

EXPOSE 8080

COPY docker-entrypoint.sh .

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]
