#! /usr/bin/env bash

if [[ "$1" = "buildup" ]]; then
    # buildup   # 빌드 후 container를 띄웁니다.
    docker build --rm -t example-springboot-docker .
    docker run -d -p 8080:8080 example-springboot-docker .

    exit;
elif [[ "$1" = "build" ]]; then
    # build  # build docker image
    docker build --rm -t example-springboot-docker .

    exit;
elif [[ "$1" = "up" ]]; then
    # up     # docker container를 띄웁니다.
    docker run -d -p 8080:8080 example-springboot-docker .

    exit;
elif [[ "$1" = "stop" ]]; then
    # stop   # 띄운 container를 안전하게 종료합니다.
    CONTAINER_ID=`docker ps | grep example-springboot-docker | cut -d' ' -f1`
    docker stop ${CONTAINER_ID};

    exit;
elif [[ "$1" = "log" ]]; then
    # log   # 서버 로그를 봅니다.
    CONTAINER_ID=`docker ps | grep example-springboot-docker | cut -d' ' -f1`
    docker logs ${CONTAINER_ID} -f

    exit;
fi

# # 도움말을 출력합니다.
egrep '^ *# ' ./dev.sh | sed "s,^ *,$0," | column -t -s'#'
