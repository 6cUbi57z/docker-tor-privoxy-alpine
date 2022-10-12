FROM alpine:3.16.2

EXPOSE 8118 9050

RUN apk --update add privoxy tor runit tini

COPY service /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
