# define name for separate build phases. (this is build phase)
FROM node:alpine as builder 
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# build run phase

FROM nginx
# COPY something from build phase. 
# EB map this port
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html