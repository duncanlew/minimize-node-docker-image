FROM node:17-slim as BUILD_IMAGE

WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

# Separation
FROM node:17-slim as RUN_IMAGE
WORKDIR /usr/src/app

COPY --from=BUILD_IMAGE /usr/src/app/dist ./dist
COPY --from=BUILD_IMAGE /usr/src/app/node_modules ./node_modules

EXPOSE 8080
CMD [ "node", "dist/main.js" ]