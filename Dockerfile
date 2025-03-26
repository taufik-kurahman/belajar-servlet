FROM ubuntu:noble

ENV TOMCAT_VERSION=11.0.5

RUN apt-get update && \
    apt-get install -y openjdk-21-jdk wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/tomcat.tar.gz https://dlcdn.apache.org/tomcat/tomcat-11/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    tar xf /tmp/tomcat.tar.gz -C /opt && \
    rm /tmp/tomcat.tar.gz && \
    mv /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat

ENV CATALINA_HOME=/opt/tomcat
ENV PATH=$CATALINA_HOME/bin:$PATH

COPY target/belajar-servlet.war /opt/tomcat/webapps/belajar-servlet.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
