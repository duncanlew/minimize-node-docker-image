FROM node:17-slim

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

EXPOSE 8080
CMD [ "npm", "run", "start:prod" ]