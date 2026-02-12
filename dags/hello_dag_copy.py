from airflow import DAG
from airflow.providers.standard.operators.bash import BashOperator

from datetime import datetime

with DAG(
    dag_id="hello_from_source_copy",
    start_date=datetime(2024, 1, 1),
    schedule="@daily",
    catchup=False,
) as dag:
    BashOperator(
        task_id="say_hi",
        bash_command="echo hello from airflow",
    )
