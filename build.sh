#!/usr/bin/env bash
mvn clean package -D.mvn.test.skip=true
docker build -t hub.kzysure.com/ruixuemedia/ruixuemedia-app:latest .
docker push hub.kzysure.com/ruixuemedia/ruixuemedia-app:latest