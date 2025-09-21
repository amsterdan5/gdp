FROM scratch

COPY ./services/ai/ai /ai

RUN chmod +x /ai

CMD [ "/ai" ]

# api
EXPOSE ${GO_DEFAULT_API_PORT}