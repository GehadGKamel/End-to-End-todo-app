#install mysql image and run it
docker pull mysql:5.7

docker volume create mysql_data 

docker volume ls | grep mysql_data

docker run -d \
  --name mysql \
  -e MYSQL_USER=mysql \
  -e MYSQL_ROOT_PASSWORD=my-secret-password \
  -e MYSQL_DB=mysql_db \
  -v mysql_data:/var/lib/mysql \
  -p 3306:3306 \
  mysql:5.7

#build the app image 

docker build -t todo-app-image . 

#docker compose up

docker compose up --build
  
# to know the container ip address

docker inspect container_id | grep '"IPAddress"'


aws sts get-caller-identity
aws eks update-kubeconfig --region us-east-1 --name my_cluster