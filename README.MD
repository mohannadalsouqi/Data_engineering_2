# Data Engineering Assignment 2

***

we use a docker-compose to build the flow that contains 3 images

1. [apache/airflow](https://hub.docker.com/r/apache/airflow)
2. [redis](https://hub.docker.com/_/redis)
3. [postgres](https://hub.docker.com/_/postgres)

***
to run the application just `bash script.sh` then go to [airflow](http://localhost:8080)

user/pass airflow/airflow

you see the dag imported with the name assignment_2

then click on start button to start the flow

another way of triggering it is running the following python script

```
import requests
import json
import uuid

url = "http://localhost:8080/api/v1/dags/assignment_2/dagRuns"

payload = json.dumps({
  "dag_run_id": str(uuid.uuid4()),
  "execution_date": "2019-08-24T14:15:22Z",
  "conf": {}
})
headers = {
  'Authorization': 'Basic YWlyZmxvdzphaXJmbG93',
  'Content-Type': 'application/json',
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)

```
the csv and the image will be stored in [data](./data) folder

while for db use the following connection

`jdbc:postgresql://localhost:5432/airflow`

user/password airflow/airflow

![postgres](postgres.png)