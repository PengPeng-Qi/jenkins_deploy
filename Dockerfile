FROM node:18.16.0

# RUN npm install

WORKDIR /Jenkins_Deploy
COPY package*.json ./
RUN npm install
COPY dist ./dist
RUN npm run build

FROM nginx:1.21-alpine
COPY --from=build-stage /app/dist /usr/share/nginx/html/dist
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]