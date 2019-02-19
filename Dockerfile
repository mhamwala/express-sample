# Stage 1
FROM node:10

WORKDIR /app

RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get clean

COPY package*.json ./

RUN npm install --production

# Stage 2
FROM node:10-slim

WORKDIR /app

RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get clean

COPY --from=0 /app/node_modules /app/node_modules
COPY . /app

ENV NODE_ENV production
ENV PORT 3000

USER node

EXPOSE 3000
CMD ["npm", "start"]