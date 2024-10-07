FROM alpine:latest
RUN apk --no-cache --update add bash  

ADD ./ .
RUN chmod 777 /app
RUN chmod 777 /app/start.sh

ENTRYPOINT ["/app/start.sh"]