#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN ng build

#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/init /usr/share/nginx/html