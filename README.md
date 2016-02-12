# JRuby DRB tester

Uses OpenJDK 8 on Alpine Linux, via Docker.

```
# Build image
$ docker build --tag=jruby-drb-test .
```

```
# Use it
$ docker run -it -v `pwd`:/app/jruby-drb-test jruby-drb-test /bin/sh
```

```
