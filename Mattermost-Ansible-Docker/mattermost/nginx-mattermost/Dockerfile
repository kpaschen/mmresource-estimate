FROM nginx:1.23.3

WORKDIR /etc/nginx/

COPY mattermost /etc/nginx/conf.d/

RUN rm /etc/nginx/conf.d/default.conf \
    && ln -s /etc/nginx/conf.d/mattermost /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]





