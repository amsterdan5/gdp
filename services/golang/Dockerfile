ARG GO_VERSION
FROM golang:${GO_VERSION}

ARG TZ
ARG GO_DEFAULT_API_PORT

# 设置时区
RUN apt-get install -y tzdata \
    && ln -snf "/usr/share/zoneinfo/${TZ}" /etc/localtime \
    && echo "${TZ}" > /etc/timezone

# # 安装必要的软件包和依赖包 生成唯一码
# RUN sed -i 's/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
#     sed -i 's/security.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
#     sed -i 's/security-cdn.debian.org/mirrors.tuna.tsinghua.edu.cn/' /etc/apt/sources.list && \
#     apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y apt-utils unzip uuid-runtime

# 安装必要的软件包和依赖包 生成唯一码
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils unzip uuid-runtime

# 安装 protoc
COPY ./pkg/protoc-3.19.1.zip /tmp
RUN unzip -d /tmp/protoc /tmp/protoc-3.19.1.zip && \
    mv /tmp/protoc/bin/protoc $GOPATH/bin

ENV GOPROXY https://goproxy.cn,direct
# 安装 goctl protoc-gen-go protoc-gen-go-grpc
    # go install github.com/zeromicro/go-zero/tools/goctl@latest && \
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest && \
    go env -w GO111MODULE=on

# 清理垃圾
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

# $GOPATH/bin添加到环境变量中
ENV PATH $GOPATH/bin:$PATH

# 设置工作目录
WORKDIR /www/code

# api
EXPOSE ${GO_DEFAULT_API_PORT}