FROM ubuntu:7

RUN cd /opt && git clone https://github.com/kiwiirc/kiwiirc.git

WORKDIR /opt/KiwiIRC

EXPOSE 7778

RUN yarn install

#COPY config.js /opt/KiwiIRC

RUN yarn run build

WORKDIR /opt/KiwiIRC/dist

RUN ls

ENTRYPOINT ["/opt/KiwiIRC/dist/kiwi","-f","start"]
