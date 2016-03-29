# Debian Docker Image

Maintainer: [Robertus Lilik Haryanto]

This image is updated via pull requests to the `secangkirkopipanas/docker-debian-tomcat` [GitHub repo]. It is an extension of Debian image for OpenJDK 8 with Apache Tomcat software.

## Supported tags for Apache Tomcat 8 with OpenJDK 8
- `latest.tomcat8` [(latest.tomcat8/Dockerfile)]
- `jessie.tomcat8` [`coming soon`]

## How to start/stop Apache Tomcat?
Start Docker image
```sh
docker run -it -p 8080:8080 secangkirkopipanas/debian-tomcat:latest.tomcat8
```

Start Apache Tomcat
```sh
service tomcat start
```

Stop Apache Tomcat
```sh
service tomcat stop
```

   [Robertus Lilik Haryanto]: <mailto:robert.djokdja@gmail.com>
   [GitHub repo]: <https://github.com/secangkirkopipanas/docker-debian-tomcat>
   [(master/Dockerfile)]: <https://github.com/secangkirkopipanas/docker-debian-tomcat/blob/master/Dockerfile>
   [(jessie.tomcat8/Dockerfile)]: <https://github.com/secangkirkopipanas/docker-debian-tomcat/blob/jessie.tomcat8/Dockerfile>
