FROM nginx:stable
RUN apt-get update && apt-get install -y vim
RUN mkdir /app
COPY build/web /usr/share/nginx/html
RUN chmod -R 755 /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /app/logs
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]