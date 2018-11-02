FROM java:8-jdk
MAINTAINER mkroli
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PASS Zadrzisvojdah1
ENV USER djordje%20bajic
ENV KARAF_VERSION=4.2.1

RUN wget http://www-us.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /opt/karaf; \
    tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
    rm apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /deploy; \
    sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/karaf/etc/org.apache.felix.fileinstall-deploy.cfg

RUN wget ftp://${USER}:${PASS}@192.168.9.20/deploy/target/Authorization-0.0.4-SNAPSHOT.kar;\	
	mv Authorization-0.0.4-SNAPSHOT.kar /opt/karaf/deploy;

RUN echo "feature:install /opt/karaf/deploy/target/features.xml" | /opt/karaf/bin/karaf

VOLUME ["/deploy"]
EXPOSE 1099 8101 44444
ENTRYPOINT ["/opt/karaf/bin/karaf"]