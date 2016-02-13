# Creates alpine based java environment
#

FROM alpine:3.3
MAINTAINER kimptoc - chris@kimptoc.net

# java jdk and dev tools
RUN apk add openjdk8 --update \
    && rm -rf /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/default-jvm/jre
ENV PATH $PATH:$JAVA_HOME/bin
RUN rm /usr/bin/java && ln -s $JAVA_HOME/bin/java /usr/bin/java

RUN mkdir -p /usr/local/jruby
WORKDIR /app/jruby-drb-test
VOLUME /app/jruby-drb-test

# jruby
RUN cd /usr/local/jruby && wget -q https://s3.amazonaws.com/jruby.org/downloads/1.7.24/jruby-complete-1.7.24.jar

ENTRYPOINT ["java","-cp", "/usr/local/jruby/jruby-complete-1.7.24.jar","org.jruby.Main"]

