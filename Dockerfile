# set up the builder phrase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

# set up the run phrase
FROM nginx

EXPOSE 80

# copy the build folder generated in the builder prhase
COPY --from=builder /app/build /usr/share/nginx/html