FROM nginx:1.10

ADD dockerConfig/http/vhost.conf /etc/nginx/conf.d/default.conf
