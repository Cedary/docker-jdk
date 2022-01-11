```
docker run -d --name=java -v=/home/docker/app/xx/java/jar:/jar -v=/home/docker/app/xx/java/config:/usr/local/jdk/config -v=/home/docker/app/xx/java/logs:/usr/local/jdk/logs -p 8088:8080 --restart=always jdk8:3.0.0 java -jar /jar/app.jar
```