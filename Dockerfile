FROM node:17

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci
COPY . .

EXPOSE 8080
CMD [ "npm", "start" ]