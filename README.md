# JRuby DRB tester

Uses OpenJDK 8 on Alpine Linux, via Docker.

```
# Build image
$ docker build --tag=jruby-drb-test .
```

```
# Use it
$ docker run -it --name jruby-drb-test-con -v `pwd`:/app/jruby-drb-test jruby-drb-test /bin/sh
mvn package exec:java -Dexec.mainClass=org.jruby.Main -Dexec.args="scripts/drb_server.rb"
```

```
$ docker exec -it jruby-drb-test-con /bin/sh
mvn package exec:java -Dexec.mainClass=org.jruby.Main -Dexec.args="scripts/drb_client.rb"
```
