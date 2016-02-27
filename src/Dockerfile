FROM alpine:3.3

COPY . /

RUN apk add --no-cache nodejs && \
    adduser -D user && \
    cd /scans && \
    npm install -g

USER user
ENTRYPOINT ["node", "/usr/lib/node_modules/cloudsploit"]
