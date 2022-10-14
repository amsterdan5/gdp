FROM golang:1.18.5-alpine

RUN apk --no-cache add curl

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