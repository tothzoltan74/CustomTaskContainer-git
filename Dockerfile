FROM alpine:latest
RUN apk fix && \
    apk --no-cache --update add bash mail 