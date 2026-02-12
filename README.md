```bash
uv pip install "apache-airflow==3.1.7" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-3.1.7/constraints-3.12.txt"
```

docker compose up --build
docker compose exec airflow uv run airflow keycloak-auth-manager create-all --username keycloakadmin --password mysupersecretpassword
