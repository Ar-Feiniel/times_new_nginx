ARG ubu_tag
FROM ubuntu:${ubu_tag}
ENV TZ="Europe/Moscow"
ARG nginx_ssl_path
ARG nginx_config_path
ARG nginx_proxy_config_path
RUN apt-get update \
    && apt-get install nginx libnginx-mod-http-geoip2 nginx-common nginx-core curl tzdata -y \
    && apt-get clean \
    && rm -fr /var/lib/apt/lists/*
COPY ./nginx.conf ${nginx_config_path}/nginx.conf
ENTRYPOINT ["nginx", "-g", "daemon off;"]