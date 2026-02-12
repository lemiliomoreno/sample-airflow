FROM python:3.12
COPY --from=ghcr.io/astral-sh/uv:0.10.2 /uv /uvx /bin/

ARG AIRFLOW_VERSION=3.1.7
ARG PYTHON_CONSTRAINTS=3.12

ENV AIRFLOW_HOME=/opt/airflow \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR ${AIRFLOW_HOME}

RUN uv venv .venv

RUN uv pip install \
    "apache-airflow==${AIRFLOW_VERSION}" \
    --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_CONSTRAINTS}.txt"

EXPOSE 8080

ENTRYPOINT ["uv", "run", "airflow", "standalone"]
