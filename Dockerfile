# FROM node:14
# WORKDIR /usr/src/app
# COPY package.json app.js ./
# RUN npm install
# EXPOSE 3000
# CMD ["node", "app.js"]

# FROM node:16-alpine
# ENV NODE_ENV=production

# #MAINTAINER ypoint

# # Create app directory
# RUN mkdir -p /opt/app
# WORKDIR /opt/app
# COPY . ./

# RUN npm i

# RUN npm i --only=production

# CMD [ "node", "app.js" ]

FROM nginx:1.21.3-alpine

RUN rm /etc/nginx/conf.d/default.conf
RUN mkdir /etc/nginx/ssl
COPY nginx.conf /etc/nginx/conf.d
COPY ./etc/.auth_keys/fullchain.pem /etc/nginx/ssl/
COPY ./etc/.auth_keys/privkey.pem /etc/nginx/ssl/

WORKDIR /usr/src/app
