FROM nginx:alpine
COPY ./default.conf /etc/nginx/conf.d
COPY ./index.html /var/www/html
