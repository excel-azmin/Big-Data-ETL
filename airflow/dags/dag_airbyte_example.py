from airflow import DAG
from airflow.utils.dates import days_ago
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator
from airflow.providers.airbyte.sensors.airbyte import AirbyteJobSensor 

with DAG(dag_id='airbyte_trigger_job_example_async',
         default_args={'owner': 'airflow'},
         schedule_interval='@daily',
         start_date=days_ago(1)
    ) as dag:

    async_money_to_json = AirbyteTriggerSyncOperator(
        task_id='airbyte_async_money_json_example',
        airbyte_conn_id='airbyte_conn_example',
        connection_id='1e3b5a72-7bfd-4808-a13c-204505490110',
        asynchronous=True,
    )

    airbyte_sensor = AirbyteJobSensor(
        task_id='airbyte_sensor_money_json_example',
        airbyte_conn_id='airbyte_conn_example',
        airbyte_job_id=async_money_to_json.output
    )

    async_money_to_json >> airbyte_sensor