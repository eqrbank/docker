## Official site
https://hub.docker.com/_/maven/

## Dockerfile
```
FROM openjdk:7-jdk

ARG MAVEN_VERSION=3.3.9
ARG USER_HOME_DIR="/root"

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
    | tar -xzC /usr/share/maven --strip-components=1 \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

COPY mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
COPY settings-docker.xml /usr/share/maven/ref/

## add by nicho
### init tools
RUN apt install git openssh vim unzip -y
### init nexus
RUN mkdir -p /root/.m2/repository/
ADD settings.xml /root/.m2/
### init git
RUN mkdir -p /root/.ssh/
RUN git config --global user.email "maven@eqrbank.com"
RUN git config --global user.name "maven"

VOLUME "$USER_HOME_DIR/.m2"

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]
```

## run.sh
```
#!/usr/bin/env bash

docker run \
    --detach \
    --name gitlab-runner-maven \
    --restart always \
    --volume /root/.ssh:/root/.ssh \
    --volume /root/.m2:/root/.m2 \
    --volume /etc/localtime:/etc/localtime:ro \
    registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-runner-maven:latest
```

## rm.sh
```
#!/usr/bin/env bash

docker rm -vf gitlab-runner-maven
```

## update.sh
```
#!/usr/bin/env bash

sh rm.sh
docker rmi registry.cn-hangzhou.aliyuncs.com/nichozuo/gitlab-runner-maven:latest
sh run.sh
```

## after install