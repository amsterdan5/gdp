# 使用多阶段构建
ARG UBUNTU_VERSION
ARG CONTAINER_PACKAGE_URL

FROM ubuntu:${UBUNTU_VERSION}

RUN sed -i 's/ports.ubuntu.com/archive.ubuntu.com/g' /etc/apt/sources.list && \
    sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# 安装最小依赖
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    wget \
    make \
    bash-completion \
    command-not-found \
    libopus-dev \
    libopusfile-dev \
    pkg-config \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# 下载 Go
RUN wget -q -O /tmp/go.tar.gz https://golang.org/dl/go1.25.0.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf /tmp/go.tar.gz \
    && rm /tmp/go.tar.gz

# 设置 Go 环境
ENV GOROOT=/usr/local/go
ENV PATH=$GOROOT/bin:$PATH
ENV CGO_ENABLED=1
ENV PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig
ENV GOPROXY='https://goproxy.cn,https://mirrors.aliyun.com/goproxy,direct'

# 工作目录
WORKDIR /www

# 暴露端口
EXPOSE 8080

# 启动应用
CMD ["tail", "-f", "/dev/null"]