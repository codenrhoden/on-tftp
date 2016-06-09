# Copyright 2016, EMC, Inc.

FROM emccode/on-core

COPY . /RackHD/on-tftp/
WORKDIR /RackHD/on-tftp

RUN mkdir -p ./node_modules \
  && ln -s /RackHD/on-core ./node_modules/on-core \
  && ln -s /RackHD/on-core/node_modules/di ./node_modules/di \
  && npm install --ignore-scripts --production

EXPOSE 69/udp
VOLUME /RackHD/on-tftp/static/tftp
CMD [ "node", "/RackHD/on-tftp/index.js" ]
