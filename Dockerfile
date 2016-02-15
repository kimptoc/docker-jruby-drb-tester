# Creates alpine based java environment
#

FROM centos:6.7
MAINTAINER kimptoc - chris@kimptoc.net


RUN yum clean all; \
    rpm --rebuilddb; \
    yum install -y wget which tar sudo java-1.7.0-openjdk

ENV JAVA_HOME /usr/lib/jvm/jre
ENV PATH $PATH:$JAVA_HOME/bin
RUN rm /usr/bin/java && ln -s $JAVA_HOME/bin/java /usr/bin/java

RUN mkdir -p /usr/local/jruby
WORKDIR /app/jruby-drb-test
VOLUME /app/jruby-drb-test

# jruby
RUN cd /usr/local/jruby && wget -q https://s3.amazonaws.com/jruby.org/downloads/1.7.24/jruby-complete-1.7.24.jar

ENTRYPOINT ["java","-Xrs -XX:+AggressiveOpts -XX:NewRatio=1 -XX:MaxGCPauseMillis=1 -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:CompileThreshold=100 -XX:+HeapDumpOnOutOfMemoryError -verbose:gc -Xloggc:gc.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintTenuringDistribution -XX:+PrintGCApplicationConcurrentTime -XX:+PrintGCApplicationStoppedTime -XX:PermSize=300m -XX:MaxPermSize=300m ","-cp", "/usr/local/jruby/jruby-complete-1.7.24.jar","org.jruby.Main"]

