mkdir ./dags ./logs ./plugins ./data > /dev/null 2>&1

docker-compose up airflow-init > /dev/null 2>&1

echo 'init complete'

docker-compose up -d

docker exec airflow mkdir -p /home/airflow/data

sleep 10

curl -X PATCH "http://localhost:8080/api/v1/dags/assignment_2" -H  "accept: application/json" -H  "Content-Type: application/json" -H "Authorization: Basic YWlyZmxvdzphaXJmbG93" -d "{\"is_paused\":false}" > /dev/null 2>&1


echo 'airflow started'
