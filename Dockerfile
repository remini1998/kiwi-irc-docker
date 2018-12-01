FROM node:7 AS build-env

RUN cd /opt && git clone https://github.com/kiwiirc/kiwiirc.git

WORKDIR /opt/kiwiirc

RUN yarn install

#COPY config.js /opt/kiwiirc

RUN yarn run build

WORKDIR /opt/kiwiirc/dist

FROM httpd:2.4

EXPOSE 7778:80

WORKDIR /usr/local/apache2/htdocs/

COPY --from=build-env /opt/kiwiirc/dist/* /usr/local/apache2/htdocs/


