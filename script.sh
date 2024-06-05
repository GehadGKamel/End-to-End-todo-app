#install mysql image and run 
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
  


