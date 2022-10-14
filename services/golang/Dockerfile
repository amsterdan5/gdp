ARG GO_VERSION
FROM golang:${GO_VERSION}

ARG TZ

LABEL maintainer=""

# 设置时区
RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone

RUN apk --no-cache add curl git

ENV GOPROXY https://goproxy.cn,direct

# 安装 goctl protoc protoc-gen-go protoc-gen-go-grpc
USER root
RUN curl -L -o /tmp/protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.19.1/protoc-3.19.1-linux-x86_64.zip && \
    unzip -d /tmp/protoc /tmp/protoc.zip && \
    mv /tmp/protoc/bin/protoc $GOPATH/bin && \
    go install github.com/zeromicro/go-zero/tools/goctl@latest && \
    go install google.golang.org/protobuf/cmd/protoc-gen-go@latest && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# $GOPATH/bin添加到环境变量中
ENV PATH $GOPATH/bin:$PATH

# 设置工作目录
WORKDIR /usr/src/code

# api
EXPOSE 8000
EXPOSE 8001
EXPOSE 8002
EXPOSE 8003

# rpc
EXPOSE 9000
EXPOSE 9001
EXPOSE 9002
EXPOSE 9003