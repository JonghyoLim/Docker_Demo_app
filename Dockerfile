# Dockerfile - we build own image
FROM node:13-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

# RUN - execute any Linux command, directory is created INSIDE of the container!
# no Laptop env, no host env
RUN mkdir -p /home/app  

# COPY - executes on the HOST machine
COPY ./app /home/app

# set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

# no need for /home/app/server.js because of WORKDIR
CMD ["node", "server.js"]
