# build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

#docker run -p 8080:80 <image_id>

#docker run container npm run test -- --coverage