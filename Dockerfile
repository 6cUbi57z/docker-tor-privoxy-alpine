FROM alpine:3.16.2

EXPOSE 8118 9050

RUN apk --no-cache --update add privoxy tor runit tini curl

COPY service /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]

HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=3 \
    CMD curl -s --no-buffer --proxy http://localhost:8118 https://check.torproject.org | grep "Congratulations. This browser is configured to use Tor." || exit 1