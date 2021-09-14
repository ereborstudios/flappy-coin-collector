FROM nginx:alpine

COPY ./builds/collector-example-html5.zip /tmp/
RUN unzip -d /var/www /tmp/collector-example-html5.zip
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 3000
