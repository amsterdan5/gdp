FROM node:11 as builder

ARG YAPI_VERSION

RUN apt-get install -y  git python make openssl tar gcc
ADD yapi-${YAPI_VERSION}.tar.gz /home/
RUN mkdir /api && mv /home/yapi-${YAPI_VERSION} /api/vendors

RUN cd /api/vendors \
    && npm install --production --registry https://registry.npm.taobao.org

FROM node:11

ENV TZ="Asia/Shanghai" HOME="/"
WORKDIR ${HOME}
COPY --from=builder /api/vendors /api/vendors

EXPOSE 3000

COPY docker-entrypoint.sh /api/
RUN chmod 755 /api/docker-entrypoint.sh

ENTRYPOINT ["/api/docker-entrypoint.sh"]