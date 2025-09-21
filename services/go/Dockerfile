FROM scratch

# 设置工作目录
WORKDIR /www/code

COPY ../../../github.com/amsterdan/homeai/ai ./ 

CMD [ "ai" ]

# api
EXPOSE ${GO_DEFAULT_API_PORT}