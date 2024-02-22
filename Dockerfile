FROM ghcr.io/static-web-server/static-web-server:2-alpine
COPY build/web/. /public
