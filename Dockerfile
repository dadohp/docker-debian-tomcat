# Dockerfile for Apache Tomcat on top of Debian with Singapore and Indonesia mirror site.

FROM secangkirkopipanas/debian:latest.openjdk8
MAINTAINER Robertus Lilik Haryanto <robert.djokdja@gmail.com>

# Adding tomcat user
RUN \
	echo "### Adding tomcat user into the system" && \
    adduser --system --shell /bin/bash --gecos "Tomcat Java Servlet and JSP engine" --group --disabled-password  --home /home/tomcat tomcat

# Installing Apache Tomcat
RUN \
	echo "### Installing Apache Tomcat" && \
	TOMCAT_VERSION="8.0.33" && \
	TOMCAT_NAME="apache-tomcat-$TOMCAT_VERSION" && \
	TOMCAT_TARGZ_NAME="$TOMCAT_NAME.tar.gz" && \
	TOMCAT_URL="http://download.nus.edu.sg/mirror/apache/tomcat/tomcat-8/v$TOMCAT_VERSION/bin/$TOMCAT_NAME.tar.gz" && \
	TOMCAT_PATH=/usr/share/tomcat8 && \
	mkdir -p ~/tmp && \
	cd ~/tmp && \
    wget $TOMCAT_URL && \
	tar xvzf ./$TOMCAT_TARGZ_NAME && \
	rm ./$TOMCAT_TARGZ_NAME && \
	mkdir -p $TOMCAT_PATH && \
	mv -f ~/tmp/$TOMCAT_NAME/* $TOMCAT_PATH/ && \
	ln -s $TOMCAT_PATH /usr/share/tomcat && \
	chown -R tomcat:tomcat $TOMCAT_PATH && \
	ln -s $TOMCAT_PATH/logs /var/log/tomcat && \
	chmod +x $TOMCAT_PATH/bin/*.sh

# Copying tomcat command
COPY ./tomcat /etc/init.d/tomcat

# Changing the permissions of the newly created file and add the correct symlinks automatically
RUN \
	echo "### Changing the permissions of the newly created file and add the correct symlinks automatically" && \
	chmod 755 /etc/init.d/tomcat && \
	update-rc.d tomcat defaults

ENV TOMCAT_MIN_HEAP_SIZE 512m
ENV TOMCAT_MAX_HEAP_SIZE 1024m
ENV CATALINA_HOME /usr/share/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

# Exposing default HTTP port of Apache Tomcat
EXPOSE 8080

# Define default command
CMD ["/bin/bash"]
