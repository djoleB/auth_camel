FROM java:8-jdk
MAINTAINER diteam
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PASS Zadrzisvojdah1	
ENV KARAF_VERSION=4.2.1

RUN wget http://www-us.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /opt/karaf; \
    tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
    rm apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir /deploy; \
    sed -i 's/^\(felix\.fileinstall\.dir\s*=\s*\).*$/\1\/deploy/' /opt/karaf/etc/org.apache.felix.fileinstall-deploy.cfg

RUN wget ftp://djordje%20bajic:${PASS}@192.168.9.20/deploy/target/Authorization-0.0.4.kar;\	
	mv Authorization-0.0.4.kar /opt/karaf;

RUN echo "feature:repo-add camel 2.22.1" | /opt/karaf/bin/karaf; \
	echo "feature:install camel-core camel-jsonpath camel-http camel-sql camel-gson camel-restlet camel-blueprint" | /opt/karaf/bin/karaf; \
	echo "kar:install file:/opt/karaf/Authorization-0.0.4.kar" | /opt/karaf/bin/karaf;\
	echo "kar:list" | /opt/karaf/bin/karaf;\
	echo "feature:install Humanity-Authorization-Authentication" | /opt/karaf/bin/karaf;
	
VOLUME ["/deploy"]
EXPOSE 1099 8101 44444
ENTRYPOINT ["/opt/karaf/bin/karaf"]
