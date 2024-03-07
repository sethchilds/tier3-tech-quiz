#!/bin/bash

# Clean out temporary files from bind mount and logs
rm -rf ./tmp/* ./log/*

# Remove previous container if exists
docker ps -a | fgrep t3 | awk '{print $1}' | xargs docker rm

docker build -t teachstone:tier3-tech-quiz .

docker run -v $PWD:/rails --name=t3tq --env-file ./env-for-testing-purposes -p 3000:3000 teachstone:tier3-tech-quiz

exit 0
