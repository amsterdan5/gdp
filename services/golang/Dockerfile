ARG GO_VERSION
FROM golang:${GO_VERSION}

ARG TZ
ARG GO_DEFAULT_API_PORT

# 设置时区
RUN apk --no-cache add tzdata \
    && cp "/usr/share/zoneinfo/${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone

RUN apk --no-cache add curl git

ENV GOPROXY https://goproxy.cn,direct
ENV GO111MODULE on

# 安装 goctl protoc protoc-gen-go protoc-gen-go-grpc
USER root
COPY ./pkg /tmp/pkg
RUN unzip -d /tmp/pkg/protoc /tmp/pkg/protoc-3.19.1.zip && \
    mv /tmp/pkg/protoc/bin/protoc $GOPATH/bin && \
    rm -rf /tmp/pkg && \
    go install github.com/zeromicro/go-zero/tools/goctl@latest && \
    go install google.golang.org/protobuf/cmd/protoc-gen-go@latest && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# $GOPATH/bin添加到环境变量中
ENV PATH $GOPATH/bin:$PATH

# 设置工作目录
WORKDIR /go/src/code

# api
EXPOSE ${GO_DEFAULT_API_PORT}