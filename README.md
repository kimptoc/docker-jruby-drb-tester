# JRuby DRB tester

Uses OpenJDK 8 on Alpine Linux, via Docker.

```
# Build image
$ docker build --tag=jruby-drb-test .
```

```
# Use it
$ docker run -it --rm --name jruby-drb-test-con -v `pwd`:/app/jruby-drb-test jruby-drb-test /bin/sh
java -cp /usr/local/jruby/jruby-complete-1.7.24.jar org.jruby.Main scripts/drb_server.rb
```


```
$ docker exec -it jruby-drb-test-con /bin/sh
java -cp /usr/local/jruby/jruby-complete-1.7.24.jar org.jruby.Main scripts/drb_client.rb
```
