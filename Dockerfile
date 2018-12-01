#FROM node:7 AS build-env
FROM node:7

EXPOSE 7778:8080

RUN cd /opt && git clone https://github.com/kiwiirc/kiwiirc.git

WORKDIR /opt/kiwiirc

RUN yarn install

#COPY config.js /opt/kiwiirc

RUN yarn run build

WORKDIR /opt/kiwiirc/dist
CMD ["yarn", "run", "dev"]

# FROM httpd:2.4-alpine

# EXPOSE 7778:80

# WORKDIR /usr/local/apache2/htdocs/

# COPY --from=build-env /opt/kiwiirc/dist/* /usr/local/apache2/htdocs/


