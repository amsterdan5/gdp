ARG GO_VERSION
FROM golang:${GO_VERSION}-alpine

# 设置环境变量
ENV CGO_ENABLED=1 \
    GOARCH=amd64 \
    SHELL=/bin/bash

# 安装 Opus 开发库
RUN apk add --no-cache \
    build-base \
    pkgconfig \
    opus-dev

# 设置工作目录
WORKDIR /code

# 创建持久化目录
VOLUME /code

# 设置默认命令
CMD ["tail", "-f", "/dev/null"]