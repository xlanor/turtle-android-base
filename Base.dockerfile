FROM node:12

# Set the npm location and changes the path
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH="/home/node/.npm-global/bin:/home/node/.local/bin:${PATH}"


RUN apt-get update
# Install python3 and make first.
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev python3-pip python3 &&\
    pip3 install --upgrade pip setuptools

# Install Java
RUN mkdir -p /usr/share/man/man1 && \
    apt-get update -y && \
    apt-get install -y openjdk-8-jdk

# Install some additional utilities
RUN apt-get install unzip -y && \
    apt-get autoremove -y &&\
    apt-get install sudo -y &&\
    apt-get install vim -y &&\ 
    apt-get install rsync -y &&\
    apt-get install curl -y && \
    apt-get install jq -y


# Switch to the node user
USER node

RUN npm install -g gulp-cli turtle-cli@0.13.7

RUN turtle setup:android --sdk-version 35.0.0
