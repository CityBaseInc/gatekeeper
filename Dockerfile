# Dockerfile
FROM node:8.9.1

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

CMD [ "npm", "start" ]
