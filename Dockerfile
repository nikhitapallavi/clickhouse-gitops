FROM alpine:3.19

RUN apk add --no-cache curl bash  && curl -L https://github.com/pressly/goose/releases/download/v3.16.0/goose_linux_x86_64 -o /usr/local/bin/goose  && chmod +x /usr/local/bin/goose

WORKDIR /migrations
