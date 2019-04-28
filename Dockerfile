# set up the builder phrase
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN yarn install

COPY . .

RUN yarn build

# set up the run phrase
FROM nginx

# copy the build folder generated in the builder prhase
COPY --from=builder /app/build /usr/share/nginx/html