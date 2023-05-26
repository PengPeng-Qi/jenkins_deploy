FROM node:18.16.0

RUN npm install

COPY dist/index.html /usr/share/nginx/html/
COPY dist/js /usr/share/nginx/html/js/
COPY dist/css /usr/share/nginx/html/css/
COPY dist/favicon.ico /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]