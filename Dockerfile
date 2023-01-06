FROM node:16.19

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

ENV PATH=$PATH:/home/node/.npm-global/bin

WORKDIR /app/lcm-swag
COPY . .

RUN npm install -g lerna yarn node-gyp node-pre-gyp 

RUN yarn install

RUN cd shop && yarn install 

RUN yarn run build:dist && yarn run start