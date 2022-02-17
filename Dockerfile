FROM node:12.17.0-alpine as builder

WORKDIR '/app'

COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .
RUN npm run generate

FROM nginx
COPY --from=builder /app/dist /usr/share/nginx/html
