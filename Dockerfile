# FROM nikolaik/python-nodejs:python3.7-nodejs12-alpine
# ENV NODE_ENV=production

# # MAINTAINER ypoint

# # Create app directory
# RUN mkdir -p /opt/app
# WORKDIR /opt/app
# COPY . ./

# RUN npm i

# RUN npm i --only=production

# CMD [ "node", "server.js" ]
FROM nikolaik/python-nodejs:python3.10-nodejs18-slim
#FROM nikolaik/python-nodejs:python3.7-nodejs12-slim
#FROM nikolaik/python-nodejs:python3.7.3-nodejs12-alpine
ENV NODE_ENV=production

MAINTAINER ypoint
#Installation
RUN python -m pip install -U --user ortools
# RUN pip install ortools
RUN pip install PyMySQL
RUN pip install secure-smtplib
RUN python -m pip install ConfigParser
RUN python -m pip install requests
RUN python -m pip install datetime

# Create app directory
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY . ./

RUN npm i

RUN npm i --only=production

CMD [ "node", "server.js" ]
