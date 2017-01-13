#https://hub.docker.com/_/node/
FROM node:latest

# Install Webpack
RUN npm install -g webpack

# init ssh
VOLUME /root/.ssh/
# init git
RUN git config --global user.email "nodejs@eqrbank.com"
RUN git config --global user.name "nodejs"

# Define default command.
CMD ["/bin/sh"]