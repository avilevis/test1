# Use the latest LTS (long term support) version carbon of node available
#FROM node:carbon
FROM alpine:3.4

RUN apk add --update nodejs bash git

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm install --only=production

# Bundle app source
COPY . .

# App binds to port 8080
EXPOSE 3000

# Define the command to run your app using CMD
CMD [ "npm", "start" ]