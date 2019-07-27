# Copyright (c) Tetrate, Inc 2019 All Rights Reserved.

FROM nginx:alpine
COPY apps/root/build /usr/share/nginx/html
COPY apps/a/build /usr/share/nginx/html/a
COPY apps/b/build /usr/share/nginx/html/b
COPY nginx.conf /etc/nginx/nginx.conf
COPY server.conf.template /etc/nginx/conf.d/
COPY entrypoint.sh /
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]
