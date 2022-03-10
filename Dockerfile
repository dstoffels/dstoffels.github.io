FROM node:14-bullseye as build
WORKDIR /src
COPY package*.json ./
COPY package-lock.json ./
RUN npm ci
COPY ./ ./

FROM nginx:stable-alpine as prod

COPY --from=build /src/ usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]