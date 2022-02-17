FROM node:17-slim as DEVELOPMENT

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build


FROM node:17-slim as PRODUCTION

WORKDIR /usr/src/app

COPY --from=BUILD_IMAGE /usr/src/app/dist ./dist
COPY --from=BUILD_IMAGE /usr/src/app/package.json ./package.json
COPY --from=BUILD_IMAGE /usr/src/app/package-lock.json ./package-lock.json

RUN npm ci --production

EXPOSE 8080
CMD [ "npm", "run", "start:prod" ]