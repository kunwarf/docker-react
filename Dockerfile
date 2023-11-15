From node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN  npm run build

From nginx
Expose 80
COPY --from=builder /app/build /usr/share/nginx/html