#stage 1
FROM node:latest as node
WORKDIR /app
COPY . .

#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/init /usr/share/nginx/html

# #stage 3
# #!/bin/sh
# ids=$(docker ps -a -q)
# for id in $ids
# do
#   echo "$id"
#   docker stop $id && docker rm $id
# done