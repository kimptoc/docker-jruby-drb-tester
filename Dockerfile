# Creates alpine based java environment
#

FROM alpine:3.3
MAINTAINER kimptoc - chris@kimptoc.net

# java jdk and dev tools
RUN apk add openjdk8 --update \
    && rm -rf /var/cache/apk/*

#ENV JAVA_HOME /usr/java/default
ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre
ENV PATH $PATH:$JAVA_HOME/bin
RUN rm /usr/bin/java && ln -s $JAVA_HOME/bin/java /usr/bin/java

# maven
RUN wget -qO- http://mirror.ox.ac.uk/sites/rsync.apache.org/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar -xz -C /usr/local
RUN cd /usr/local && ln -s ./apache-maven-3.3.9 maven
ENV MAVEN_HOME /usr/local/maven
RUN ln -s $MAVEN_HOME/bin/mvn /usr/bin/mvn

# ant
RUN wget -qO- http://mirror.vorboss.net/apache//ant/binaries/apache-ant-1.9.6-bin.tar.gz | tar -xz -C /usr/local
RUN cd /usr/local && ln -s ./apache-ant-1.9.6 ant
ENV ANT_HOME /usr/local/ant
RUN ln -s $ANT_HOME/bin/ant /usr/bin/ant
