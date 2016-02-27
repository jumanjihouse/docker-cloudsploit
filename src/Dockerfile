FROM alpine:3.3

COPY . /

RUN apk add --no-cache nodejs && \
    cd /scans && \
    npm install -g

ENTRYPOINT ["node", "/usr/lib/node_modules/cloudsploit"]
