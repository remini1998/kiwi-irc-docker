FROM node:7

RUN cd /opt && git clone https://github.com/kiwiirc/kiwiirc.git

WORKDIR /opt/kiwiirc

EXPOSE 7778

RUN yarn install

#COPY config.js /opt/kiwiirc

RUN yarn run build

WORKDIR /opt/kiwiirc/dist

RUN ls

ENTRYPOINT ["/opt/kiwiirc/dist/kiwi","-f","start"]
