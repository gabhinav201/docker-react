FROM node:16-alpine as builder
WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .
# this will build the build files into build folder. 
RUN npm run build   

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
