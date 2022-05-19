FROM nginx:alpine
COPY --from=node /app/dist/init /usr/share/nginx/html