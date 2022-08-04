# FROM node:14
# WORKDIR /usr/src/app
# COPY package.json app.js ./
# RUN npm install
# EXPOSE 3000
# CMD ["node", "app.js"]

FROM node:16-alpine
#ENV NODE_ENV=production

#MAINTAINER ypoint

# Create app directory
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY . ./

RUN npm i

RUN npm i --only=production

CMD [ "node", "server.js" ]
