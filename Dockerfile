FROM node:lts-alpine AS builder

COPY ./src/. /app

WORKDIR /app
RUN rm -rf node_modules \
    && rm -rf package-lock.json \
    && npm install \
    && npm run generate

FROM nginx:latest

WORKDIR /usr/share/nginx/html
EXPOSE 80

RUN mkdir -p /app/storage/cloud/logs \
    && rm /etc/nginx/conf.d/default.conf \
    && rm -rf /usr/share/nginx/html/*

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/.output/public/. .

ENTRYPOINT ["nginx", "-g", "daemon off;"]
