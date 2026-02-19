from datetime import datetime, timedelta
from airflow import DAG
from airflow.providers.docker.operators.docker import DockerOperator

with DAG(
    "docker_container_example",
    start_date=datetime(2024, 1, 1),
    schedule="@daily",
    catchup=False,
    tags=["docker", "example"],
) as dag:

    # Simple Python task in container
    container_one = DockerOperator(
        task_id="run_python_in_container_1",
        image="python:3.9-slim",
        # command='python -c "print(\'Hello from Docker container 1!\')"',
        command="sleep 10",
        docker_url="unix://var/run/docker.sock",
        network_mode="bridge",
    )

    container_two = DockerOperator(
        task_id="run_python_in_container_2",
        image="python:3.9-slim",
        # command='python -c "print(\'Hello from Docker container 2!\')"',
        command="sleep 10",
        docker_url="unix://var/run/docker.sock",
        network_mode="bridge",
    )
