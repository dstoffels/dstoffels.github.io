FROM node:14
WORKDIR /user/src
COPY package*.json ./
RUN npm ci
COPY ./ ./
ENV APP_PORT 8080
EXPOSE 8080
